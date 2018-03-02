# HyperBeast

A mini e-commerce application built with Rails 4.2.

## Screenshots

!["Home Page"](https://github.com/michael-38/tweeter/blob/master/docs/home_page.png)
!["Composing a Tweet"](https://github.com/michael-38/tweeter/blob/master/docs/compose_tweet.png)
!["Submitted Tweet"](https://github.com/michael-38/tweeter/blob/master/docs/submit_tweet.png)

## Setup

1.  Fork & Clone
2.  Run `bundle install` to install dependencies
3.  Run `bin/rake db:reset` to create, load and seed db
4.  Create .env file
5.  Sign up for a Stripe account
6.  Put Stripe (test) keys into appropriate .env vars
7.  Run `bin/rails s -b 0.0.0.0` to start the server

## Usage

To access admin dashboard (products and categories), use username "Jungle" and password "book".

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.
More information: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
