# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subscription.destroy_all
Customer.destroy_all

cust_a = Customer.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address})
cust_b = Customer.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, address: Faker::Address.full_address})

a1 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
a2 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
a3 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
a4 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
a5 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
a6 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
a7 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
a8 = cust_a.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})

b1 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
b2 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
b3 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
b4 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100)})
b5 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
b6 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
b7 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
b8 = cust_b.subscriptions.create({title: Faker::Lorem.sentence, frequency: Faker::Number.between(from: 1, to: 100), status: 'cancelled'})
