require "play_scrape/version"

module PlayScrape

  PLAY_URL = 'https://play.google.com/store/apps/details?id='

  APP_DESC_CSS_PATH = 'html body div#wrapper.wrapper-with-footer div#body-content div.details-wrapper div.details-section div.details-section-contents div.show-more-content div.app-orig-desc'
  APP_ICON_CSS_PATH = 'html body div#wrapper.wrapper-with-footer div#body-content div.details-wrapper div.details-info div.cover-container img.cover-image'
  APP_RATING_CSS_PATH = 'div.score'
  APP_NUM_RATINGS_CSS_PATH = 'span.reviews-num'
  APP_DEV_URL_CSS_PATH = 'a.dev-link'
  APP_INSTALL_CSS_PATH = 'html body div#wrapper.wrapper-with-footer div#body-content div.details-wrapper div.details-section div.details-section-contents div.meta-info div.content'

  def scrape_app_info_for(package_name)
    # res = Typhoeus.get(PLAY_URL + package_name)

    # if res.code == 200
    #   app_info = Hash.new
    #   html = Nokogiri::HTML(response.body)
    #   description = html.css(APP_DESC_CSS_PATH).first
    #   app_rating = html.css(APP_RATING_CSS_PATH).first
    #   num_ratings = html.css(APP_NUM_RATINGS_CSS_PATH).first
    #     

    # end
  end
end
