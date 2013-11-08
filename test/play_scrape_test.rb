require 'test/unit'
require 'play_scrape' 

class PlayScrapeTest < Test::Unit::TestCase
  TEST_PACKAGE = 'com.ea.game.fifa14_na'
  def test_scraping_app_information
    app_info = PlayScrape.scrape_app_info(TEST_PACKAGE)

    assert_equal 'com.ea.game.fifa14_na', app_info.package_name, "Package name does not match"
    assert_equal 4.6, app_info.rating, "Play rating does not match"
    assert_equal 500000, app_info.min_installs
    assert_equal 1000000, app_info.max_installs
    assert_operator  36514, :<=, app_info.num_ratings
    assert_match 'REAL PLAYERS. REAL TEAMS. REAL LEAGUES.', app_info.description, "Description doesn't match"
    assert_match 'http://help.ea.com', app_info.dev_url, "Developer url doesn't match"
  end
end
