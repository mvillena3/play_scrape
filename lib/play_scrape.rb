require "play_scrape/version"
require "play_scrape/app"

require 'typhoeus'
require 'nokogiri'

module PlayScrape

  PLAY_URL = 'https://play.google.com/store/apps/details?id='

  APP_DESC_CSS_PATH = 'html body div#wrapper.wrapper-with-footer div#body-content div.details-wrapper div.details-section div.details-section-contents div.show-more-content div.id-app-orig-desc'
  APP_ICON_CSS_PATH = 'html body div#wrapper.wrapper-with-footer div#body-content div.details-wrapper div.details-info div.cover-container img.cover-image'
  APP_RATING_CSS_PATH = 'div.score'
  APP_NUM_RATINGS_CSS_PATH = 'span.reviews-num'
  APP_DEV_URL_CSS_PATH = 'a.dev-link'
  APP_NAME_CSS_PATH = 'div.details-wrapper div.details-info div.info-container div.document-title div'
  APP_ADDITIONAL_INFO_CSS_PATH = 'div.details-section div.details-section-contents div.meta-info div.content'

  VERSION_REGEX = /\d\.\d(\.\d)?/
  URL_REGEX = /q=(https?:\/\/[\S]+?)&/
  INSTALLS_REGEX = /\d+ - \d+/


  # Returns @app_info of AppInfo class
  def self.scrape_app_info(package_name)
    res = self.get_html_page_for(package_name)

    if res.code == 200
      app_info = PlayScrape::AppInfo.new
      html = Nokogiri::HTML(res.body)
      name = html.css(APP_NAME_CSS_PATH).first
      description = html.css(APP_DESC_CSS_PATH).first
      app_rating = html.css(APP_RATING_CSS_PATH).first
      num_ratings = html.css(APP_NUM_RATINGS_CSS_PATH).first
      icon_url = html.css(APP_ICON_CSS_PATH).first

      # A bit hacky below but it'll do
      installs_text = html.css(APP_ADDITIONAL_INFO_CSS_PATH)[2].text.strip
      installs = installs_text.gsub(",", "").split("-").map(&:to_i)  if installs_text.match(INSTALLS_REGEX)
      version_text = html.css(APP_ADDITIONAL_INFO_CSS_PATH)[3].text.strip
      version = version_text if version_text.match(VERSION_REGEX)

      dev_links = html.css(APP_DEV_URL_CSS_PATH)
      dev_url = ""
      if !dev_links.empty? && dev_links.first.text.match(/Visit Developer's Website/)
        dev_url = dev_links.first.attributes['href'].value.match(URL_REGEX)[1] 
      end

      app_info.app_name = name.text
      app_info.package_name = package_name
      app_info.description = description.inner_html
      app_info.rating = app_rating.text.to_f
      app_info.num_ratings = num_ratings.text.gsub(",", "").to_i
      app_info.icon_url = icon_url.attributes['src'].value
      app_info.dev_url = dev_url
      app_info.min_installs = installs.first
      app_info.max_installs = installs.last
      app_info.version = version

      app_info
    end
  end

  def self.get_html_page_for(package_name)
    res = Typhoeus.get(PLAY_URL + package_name)
  end
end
