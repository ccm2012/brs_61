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
    summary: "aaaaaaaaa aaaaaaaaa"*150,
    content: "aaaaaaaaa aaaaaaaaa"*400,
    rating: 0
  )
end

35.times do |n|
  user_id = [1, 2].sample
  book_id = n+1
  mark_as = (0..2).to_a.sample
  ReadingHistory.create!(
    user_id: user_id,
    book_id: book_id,
    mark_as: mark_as
  )
end

users = (1..3).to_a
35.times do |n|
  user_id = users.sample
  book_id = n+1
  rate = (1..10).to_a.sample
  content = "aaaaaaaaa aaaaaaaaa"*150
  Review.create!(
    user_id: user_id,
    book_id: book_id,
    rate: rate,
    content: content
  )
end
