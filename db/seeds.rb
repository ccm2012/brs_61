# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
35.times do |n|
  name = "#{n*10}"
  email = "example-#{n+1}@railstutorial.org"
  encrypted_password = ENV["GMAIL_PASSWORD"]
  User.create!(
    name: name,
    email: email,
    password: encrypted_password,
  )
end
