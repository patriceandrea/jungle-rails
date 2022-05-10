# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

### Main Page
![alt text](/public/images/jungle-header.png)

### Main Page - Products 
![alt text](/public/images/jungle-homepage-product.png)

### My Cart 
![alt text](/public/images/jungle-cart.png)

### Confirmation Order 
![alt text](/public/images/junglr-confirmation2.png)

#### Features implemented for the Jungle: 
- **Sold Out Badge**: If a product has 0 quantity, a sold out badge is displayed. 
- **Admin Categories**: Restful routes was created into the app where the admin can create a new category. 
- **User Authentication**: User can sign up and login from any page of the app. 
- **Order Details Page**: An Order confirmation page is created to display content of the product including the final amount of the order. 
# Setup

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

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
