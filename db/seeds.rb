# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create name: "Bill Murray", email: "bill@gmail.co", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'
u2 = User.create name: "Tom Cru", email: "tom@gmail.co", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'
u3 = User.create name: "This Guy", email: "textchimp@gmail.co", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'
u4 = User.create name: "Alice Tang", email: "alice@gmail.co", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'

puts "User total count #{User.all.count}"

Project.destroy_all
p1 = Project.create name: "The Rocks Project", description: "Dining and entertainment options and popular galleries and museums.", location: "100 George St NSW 2000", image: 'http://fillmurray.com/300/300'
p2 = Project.create name: "Walsh Bay Project", description: "Walsh Bay was once the heart of the working harbour, and the Sydney village’s old timber wharves are now home to drama theatres, performance spaces and galleries.", location: "22 Hickson Rd Walsh Bay NSW 2000", image: 'http://fillmurray.com/300/300'
p3 = Project.create name: "Chinatown Project", description: "Chinatown are your tickets to delicious Chinese, Thai and Korean food and dining, as well as cool markets and leading theatres.", location: "451 Pitt St NSW 2000", image: 'http://fillmurray.com/300/300'
p4 = Project.create name: "Sydney Opera House Project", description: "The Sydney Opera House is a multi-venue performing arts centre in Sydney, Australia.", location: "Bennelong Point Sydney NSW 2000", image: 'http://fillmurray.com/300/300'
p5 = Project.create name: "Darlinghurst Community Space Project", description: "Chinatown are your tickets to delicious Chinese, Thai and Korean food and dining, as well as cool markets and leading theatres.", location: "277 Bourke Darlinghurst NSW 2010", image: 'http://fillmurray.com/300/300'

puts "Project total count: #{Project.all.count}"

p1.users << u1 << u2
p2.users << u3 << u4
