require 'test/unit'
require 'play_scrape' 

class PlayScrapeTest < Test::Unit::TestCase
  TEST_PACKAGE = 'com.ea.game.fifa14_na'
  def test_scraping_app_information
    app_info = PlayScrape.scrape_app_info_for(TEST_PACKAGE)


    assert_equal 'FIFA 14 by EA SPORTS™', app_info[:name]
    assert_equal 4.6, app_info[:rating]
    assert_operator  36514, :<=, app_info[:num_ratings]
    assert_match 'REAL PLAYERS. REAL TEAMS. REAL LEAGUES.', app_info[:description]
    assert_match 'http://help.ea.com', app_info[:dev_url]
  end
end
