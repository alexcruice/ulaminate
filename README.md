# Ulaminate [![Build Status](https://travis-ci.org/alexcruice/ulaminate.svg?branch=master)](https://travis-ci.org/alexcruice/ulaminate)

[Ulam spirals](https://en.wikipedia.org/wiki/Ulam_spiral) are neat. `ulaminate` can generate them.

## Installation

    $ gem install ulaminate

## Usage

```
$ ulaminate --help
Usage: ulaminate [options]
    -h, --help                       Prints this help
        --size SIZE                  The size of the side of the spiral
```

Generate a 200-pixel square, black-on-white, Ulam spiral PNG in the current directory:

```
$ ulaminate --size 200
ulam_spiral_200.png
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexcruice/ulaminate.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
