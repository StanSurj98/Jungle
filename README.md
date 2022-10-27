# Jungle

A mini e-commerce application built with Rails 6.1 for the purpose of learning how to work with existing codebases, on unfamiliar framework versions.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Admin HTTP Auth Credentials
username: "Jungle"
pass: "book"

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## How to Use Jungle!

### Landing Page
On the landing page, users are greeted with a catalogue of products in the store. Clicking on any product will bring users to their respective information pages. Clicking the Add button on the product cards will add the product to the user's cart. A sold out badge is displayed for when a certain product is out of stock.

[add image for landing page here]

### Checking Out
Clicking on the 'My Cart' icon brings a user to their checkout menu. Here users can modify their order by adding or subtracting quantities of products ordered. When ready, users may checkout with the 'Pay with Card' button. Our payments are handled via Stripe - for testing purposes please use the test card specified above. 

[add image for checkout page]

### Admin Controls
Hovering the 'Admin' button will drop a menu allowing users to see the dashboard, and the products catalogue from an Admin perspective. Clicking products, users will be prompted by an HTTP auth box to access the page. Upon access, admins may create or delete a new product. Clicking categories show a similar page where admins may create categories.

[add image of admin products page]

### Login/Register
Users may also register for an account with a bcrypt-secured password or log in to existing accounts via the nav-bar items. Logging in is not necessary for purchases in this test demo.
[add image of register page] 

### Thank you for trying out Jungle!