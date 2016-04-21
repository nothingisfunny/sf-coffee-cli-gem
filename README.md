# SfCoffee

Scraper for popular San Francisco coffee shop locations. Collects information from Starbucks API, Peet's Coffee and Tea, and Philz Coffee websites. Lists information for each store, including name, address, and phone number, allows one to search for nearest locations by ZIP Code.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sf_coffee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sf_coffee

## Usage

```
sf_coffee #runs the CLI
```

```ruby
require 'sf_coffee'

SfCoffee::Scraper.starbucks #lists all Starbucks locations in SF

```
###Example results
```ruby
[{:name=>"Starbucks Presidio & Letterman", :address=>"1 Letterman Drive, Building C, Letterman Digital Arts Center, San Francisco", :phone=>"415-441-1740", :zip_code=>"94129"},
 {:name=>"Starbucks Third & Market", :address=>"7 Third Street, Third & Market, San Francisco", :phone=>"4159799530", :zip_code=>"94103"},
 {:name=>"Starbucks Safeway - San Francisco #995", :address=>"1335 Webster, San Francisco", :phone=>"415-921-4557", :zip_code=>"94115"} ... ]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/nothingisfunny/sf-coffee-cli-gem.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

