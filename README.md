# Braintree v.zero extension for Spree Commerce

[![Code Climate](https://codeclimate.com/repos/560308aa6956801375000a4e/badges/9874199a656054d613cd/gpa.svg)](https://codeclimate.com/repos/560308aa6956801375000a4e/feed) [![Test Coverage](https://codeclimate.com/repos/560308aa6956801375000a4e/badges/9874199a656054d613cd/coverage.svg)](https://codeclimate.com/repos/560308aa6956801375000a4e/coverage) [![Circle CI](https://circleci.com/gh/spree-contrib/spree_braintree_vzero.svg?style=svg)](https://circleci.com/gh/spree-contrib/spree_braintree_vzero) [![Build Status](https://travis-ci.org/spree-contrib/spree_braintree_vzero.svg?branch=3-1-stable)](https://travis-ci.org/spree-contrib/spree_braintree_vzero)

This is the official Braintree v.zero extension for Spree. It supports:
* [Braintree Hosted Fields](https://github.com/spree-contrib/spree_braintree_vzero/wiki/1.-Hosted-Fields) -  style the credit card form to match your UI with full PCI compliance
* [PayPal Express Checkout](https://github.com/spree-contrib/spree_braintree_vzero/wiki/2.-PayPal-Express) - the fastest way for buyers to pay with PayPal - available on Spree for the first time
* [Braintree Drop-in UI](http://github.com/spree-contrib/spree_braintree_vzero/wiki/3.-Drop-in-UI) - start accepting payments ASAP

Learn more during the official PayPal workshop in New York City on June 28-29th during [OpenCommerce Conf 2016](http://opencommerceconf.org/)

Behind-the-scenes, this extension uses [Braintree Ruby SDK](https://github.com/braintree/braintree_ruby).


## Installation

1. Add this extension to your Gemfile with this line:
  ```ruby
  gem 'spree_braintree_vzero', github: 'spree-contrib/spree_braintree_vzero', branch: 'X-X-stable'
  ```

  The `branch` option is important: it must match the version of Spree you're using.
  For example, use `3-0-stable` if you're using Spree `3-0-stable` or any `3.0.x` version.

2. Install the gem using Bundler:
  ```ruby
  bundle install
  ```

3. Copy & run migrations
  ```ruby
  bundle exec rails g spree_braintree_vzero:install
  ```

4. Restart your server

  If your server was running, restart it so that it can find the assets properly.



## Heroku installation

Additional to migrations the gem adds a cron task (via the [Whenever gem](https://github.com/javan/whenever)) which is needed for updating transaction states from _submited for settlement_ to _settled_ ([Braintree v.zero transaction states](https://developers.braintreepayments.com/guides/transactions/ruby#status)). To run on Heroku you have to add a task to [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler):

```
rake spree_braintree_vzero:update_states
```

Recommended frequency is every 6 hours.


## Example application

If you want to see a working instance of Spree with this gem please see our [sample application repository](https://github.com/spark-solutions/spree_braintree_vzero_example)


## Contributing

If you'd like to contribute, please take a look at the
[instructions](CONTRIBUTING.md) for installing dependencies and crafting a good
pull request.

## License

Spree Braintree V.zero is copyright © 2015-2016
[Spark Solutions Sp. z o.o.][spark]. It is free software,
and may be redistributed under the terms specified in the
[LICENCE](LICENSE) file.

[LICENSE]: https://github.com/spark-solutions/spree_braintree_vzero/blob/master/LICENSE

## About Spark Solutions
[![Spark Solutions](http://sparksolutions.co/wp-content/uploads/2015/01/logo-ss-tr-221x100.png)][spark]

Spree Braintree V.zero is maintained by [Spark Solutions Sp. z o.o.](http://sparksolutions.co?utm_source=github) and funded by [PayPal, Inc.](http://paypal.com)
The names and logos are trademarks of PayPal, inc.

We are passionate about open source software.
We are [available for hire][spark].

[spark]:http://sparksolutions.co?utm_source=github
