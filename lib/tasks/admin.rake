namespace :db do
  task admin: :environment do
    puts "Make first user be admin"
    name = "Me"
    email = ENV["GMAIL_USERNAME"]
    encrypted_password = ENV["GMAIL_PASSWORD"]
    admin = true
    confirmation_sent_at = Time.zone.now
    confirmed_at = Time.zone.now

    User.create! name: name, email: email, password: encrypted_password,
      admin: admin, confirmation_sent_at: confirmation_sent_at, confirmed_at:
      confirmed_at
  end
end
