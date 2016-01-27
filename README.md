# docker-helpers

Collection of helpers helpers to assist in testing/developing with the
docker-api gem.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'docker-helpers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docker-helpers

## Usage

Turning on output stream requires that ENV['DEBUG'] be defined.  Then you can
pass the output stream to a Docker::Image.build method to receive output form
the image build process.

# Example

```
  DEBUG=1 bundle exec your_thing
```

```ruby
  output_stream = Docker::Helpers.output_stream
  Docker::Image.build_from_dir('.', opts, &output_stream )

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/manheim/docker-helpers.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
