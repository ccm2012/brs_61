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
    password: encrypted_password
  )
end

category = %W(Ruby Php Android)
3.times do |n|
  Category.create! name: category[n-1]
end

category_a = (1..3).to_a
35.times do |n|
  category_id = category_a.sample
  title = "Book-#{n*10}"
  author = "Author-#{n}"
  Book.create!(
    category_id: category_id,
    title: title,
    author: author,
    date_published: Time.zone.now,
    rating: 0
  )
end
