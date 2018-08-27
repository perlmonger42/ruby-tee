# Tee

Tee::File is a Ruby class inspired by the behavior of the Unix `tee` command.
Initialize one with one or more open files and/or filenames, and everything
written to the File object will be written to all of them.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tee'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tee

## Usage

For example,

```ruby
  require 'logger'
  logger = Logger.new(MultiIO.new(STDOUT, 'tracking.log'))

  logger.warn('I have a bad feeling about this...')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tee.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
