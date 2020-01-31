# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Person.create(salutation: 'Ms', first_name: 'John', last_name: 'Doe', 
    social_security_number: 555555555)
Address.create!(person_id: 1, street: 'Apple Street', city: 'Prague', 
    state: 'Cali', zip: 12345, country: 'CZ')

Phone.create!(person_id: 1, phone_number: 123456789, comment: 'This is my home phone number')

Email.create!(person_id: 1, email: 'email@email.com', comment: 'This is a comment for email')