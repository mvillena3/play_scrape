# PlayScrape

Very simple scraper for the PlayStore for some essential info.

## Installation

    gem 'play_scrape'

## Usage

    app_info = PlayScrape.scrape_app_info(package_name_of_android_app)

    app_info.app_name
    app_info.description
    app_info.rating
    app_info.num_ratings
    app_info.dev_url
    app_info.icon_url
    app_info.min_installs
    app_info.max_installs
    app_info.version

