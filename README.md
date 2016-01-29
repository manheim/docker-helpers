# docker-helpers

[![Travis](https://img.shields.io/travis/rust-lang/rust.svg)](https://github.com/manheim/docker-helpers)

Collection of helpers to assist in testing/developing with the docker-api gem.

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

You can use the Docker::Helpers.get_image method and the output stream will
be initialized automatically.  Only the DEBUG ENV var is required to turn on
the docker build output.

# Example

```
  DEBUG=1 bundle exec your_thing
```

```ruby
  #Manually setup a stream

  output_stream = Docker::Helpers.output_stream
  Docker::Image.build_from_dir('.', opts, &output_stream )

  # or let .get_image set it up.
  
  # Try to get an image that exists.  Returns an instance of
  # Docker::Image if found.

  image = Docker::Helpers.get_image(image_id: 'asdf1234')

  # No options passed will try to build a Dockerfile in the current dir.
  image = Docker::Helpers.get_image()

  # You can specifiy a build dir as well as
  # options supported by Docker::Image.build_from_dir.

  image = Docker::Helpers.get_image(build_dir: 'some_dir/')

  opts = { build_dir: 'some_dir/', t: 'a_tag', nocache: 'true' }
  image = Docker::Helpers.get_image(opts)

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/manheim/docker-helpers.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
