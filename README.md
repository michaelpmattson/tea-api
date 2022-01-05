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

The schema currently includes a one-to-many relationship between customers and subscriptions, with a planned many-to-many relationship connecting subscriptions to their included teas. Teas table may also be omitted in favor of using an external API.

![Schema](https://user-images.githubusercontent.com/826189/148130379-733e4ba5-143e-4016-9776-46d2d9265672.png)

### Dependencies

1. Ruby 2.7.2
2. Bundler 2.2.3
3. Rails 6.1.4.4
4. Postgres

### Installation

1. `bundle install`
2. `rails db:{create,migrate}`

### Seed data

`rails db:seed`

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

`POST http://localhost:3000/api/v1/subscriptions?title='My super great subscription'&frequency=21&customer_id=3`

Example response:

```
{
    "data": {
        "id": "33",
        "type": "subscription",
        "attributes": {
            "customer_id": 3,
            "frequency": 21,
            "status": "active",
            "title": "'My super great subscription'"
        }
    }
}
```

#### PATCH subscription status

`PATCH /api/v1/subscriptions/:id`

Required params:

`status`: Text (accepts 'active' or 'cancelled')

Example:

`http://localhost:3000/api/v1/subscriptions/33?status=cancelled`

Example response:

```
{
    "data": {
        "id": "33",
        "type": "subscription",
        "attributes": {
            "customer_id": 3,
            "frequency": 21,
            "status": "cancelled",
            "title": "'My super great subscription'"
        }
    }
}
```

#### GET all subscriptions for a customer:

`GET /api/v1/customers/subscriptions`

Required params:

`customer_id`: Integer

Note, customer must already exist. 

Example:

`GET /api/v1/customers/subscriptions?customer_id=3`

Example response:

```
{
    "data": [
        {
            "id": "17",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 11,
                "status": "active",
                "title": "Dolorum asperiores modi ut."
            }
        },
        {
            "id": "18",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 79,
                "status": "active",
                "title": "Et id dolor deserunt."
            }
        },
        {
            "id": "19",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 60,
                "status": "active",
                "title": "Tempora dolorem ut impedit."
            }
        },
        {
            "id": "20",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 87,
                "status": "active",
                "title": "Unde fugit aut et."
            }
        },
        {
            "id": "21",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 8,
                "status": "cancelled",
                "title": "Vitae quia repellendus corporis."
            }
        },
        {
            "id": "22",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 67,
                "status": "cancelled",
                "title": "Omnis voluptas aperiam tempora."
            }
        },
        {
            "id": "23",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 91,
                "status": "cancelled",
                "title": "Veritatis dolor reprehenderit est."
            }
        },
        {
            "id": "24",
            "type": "subscription",
            "attributes": {
                "customer_id": 3,
                "frequency": 8,
                "status": "cancelled",
                "title": "Corrupti eum est dolorum."
            }
        }
    ]
}
```



### Thanks
Thanks very much for reading. Feel free to contact me with questions!

[@michaelpmattson](https://github.com/michaelpmattson)
