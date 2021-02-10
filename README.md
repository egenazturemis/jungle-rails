# Jungle

A mini e-commerce application built with Rails 4.2.

## Screenshots

!["The products page"](https://github.com/egenazturemis/jungle-rails/blob/master/docs/products.png?raw=true)
Home page of Jungle with all the listed products, available or sold-out. 

!["The shopping cart"](https://github.com/egenazturemis/jungle-rails/blob/master/docs/cart.png?raw=true)
In the shopping cart, users can change the quantity of added products and pay with a credit card via Stripe.

!["Admin products page"](https://github.com/egenazturemis/jungle-rails/blob/master/docs/admin.png?raw=true)
Authenticated admin can add/delete products.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
