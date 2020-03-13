[![Maintainability](https://api.codeclimate.com/v1/badges/1629331b266450721936/maintainability)](https://codeclimate.com/github/solidusio-contrib/solidus_graphql_api/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/1629331b266450721936/test_coverage)](https://codeclimate.com/github/solidusio-contrib/solidus_graphql_api/test_coverage)
[![CircleCI](https://circleci.com/gh/solidusio-contrib/solidus_graphql_api.svg?style=svg)](https://circleci.com/gh/solidusio-contrib/solidus_graphql_api)

SolidusGraphqlApi
=================

Introduction goes here.

Installation
------------

Add solidus_graphql_api to your Gemfile:

```ruby
gem 'solidus_graphql_api'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g solidus_graphql_api:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs, and [Rubocop](https://github.com/bbatsov/rubocop) static code analysis. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'solidus_graphql_api/factories'
```

Releasing
---------

Your new extension version can be released using `gem-release` like this:

```shell
bundle exec gem bump -v VERSION --tag --push --remote upstream && gem release
```

Copyright (c) 2019 [name of extension creator], released under the New BSD License
