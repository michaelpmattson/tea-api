# Tea API

## Table of contents
- [Overview](#overview)
- [Schema](#schema)
- [Dependencies](#dependencies)
- [Installation](#installation)
- [Running the Specs](#running-the-specs)
- [Start the Server](#start-the-server)
- [Added Endpoints](#added-endpoints)
- [Thanks](#thanks)

### Overview

This api is a tea subscription service. Current functionality includes the ability for:

- Customers to create a subscription.
- Customers to cancel a subscription.
- Customers to view all their active or cancelled subscriptions.

Eventual functionality will include:
- Searchable teas and related subscriptions.
- Customizable tea subscriptions.

### Schema



### Dependencies

1. Ruby 2.7.2
2. Bundler 2.2.3
3. Rails 6.1.4.4
4. Postgres

### Installation

1. `bundle install`
2. `rails db:{create,migrate}`

### Running the Specs
`bundle exec rspec`

### Start the Server
`rails s`

### Added Endpoints

#### POST a subscription:

`POST /api/v1/subscriptions`

Required params:

`title`: String 

`frequency`: Integer amount of days

`customer_id`: Integer

Note, customer must already exist. 

Example:

` `

Example response:

```

```

#### PATCH subscription status

`PATCH /api/v1/subscriptions/:id`

Required params:

`status`: String (accepts 'active' or 'cancelled')

Example response:

```

```

#### GET all subscriptions for a customer:

`GET /api/v1/customers/subscriptions`

Required params:

`customer_id`: Integer

Note, customer must already exist. 

Example:

`GET /api/books/50/book_reviews`

Try it on your own from the command line. Substitute ':id' with the book id you want to view. (Note: start up your local server and substitute localhost:3000 with whichever port you're running):

`curl http://localhost:3000/api/books/:id/book_reviews`

Example response:

```

```



### Thanks
Thanks very much for reading. I'm looking forward to hearing any questions!
