# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
u1 = User.create name: "Bill Murray", email: "bill@gmail.au", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'
u2 = User.create name: "Tom Cru", email: "tom@gmail.au", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'
u3 = User.create name: "This Guy", email: "textchimp@gmail.au", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300'
u4 = User.create name: "Alice Tang", email: "alice@gmail.au", password: "chicken", password_confirmation: "chicken", image: 'http://fillmurray.com/300/300', is_admin: true

puts "User total count #{User.all.count}"

Project.destroy_all
p1 = Project.create name: "The Rocks Project", description: "Dining and entertainment options and popular galleries and museums.", location: "100 George St NSW 2000", image: 'http://fillmurray.com/300/300'
p2 = Project.create name: "Walsh Bay Project", description: "Walsh Bay was once the heart of the working harbour, and the Sydney village’s old timber wharves are now home to drama theatres, performance spaces and galleries.", location: "22 Hickson Rd Walsh Bay NSW 2000", image: 'http://fillmurray.com/300/300'
p3 = Project.create name: "Chinatown Project", description: "Chinatown are your tickets to delicious Chinese, Thai and Korean food and dining, as well as cool markets and leading theatres.", location: "451 Pitt St NSW 2000", image: 'http://fillmurray.com/300/300'
p4 = Project.create name: "Sydney Opera House Project", description: "The Sydney Opera House is a multi-venue performing arts centre in Sydney, Australia.", location: "Bennelong Point Sydney NSW 2000", image: 'http://fillmurray.com/300/300'
p5 = Project.create name: "Darlinghurst Community Space Project", description: "Chinatown are your tickets to delicious Chinese, Thai and Korean food and dining, as well as cool markets and leading theatres.", location: "277 Bourke Darlinghurst NSW 2010", image: 'http://fillmurray.com/300/300'

puts "Project total count: #{Project.all.count}"

TimeEntry.destroy_all
te1 = TimeEntry.create start_time: (Time.now - 7.days), end_time: (Time.now - 7.days + 2.hours)
te2 = TimeEntry.create start_time: (Time.now - 6.days), end_time: (Time.now - 6.days + 1.hour)
te3 = TimeEntry.create start_time: (Time.now - 5.days), end_time: (Time.now - 5.days + 1.hour)
te4 = TimeEntry.create start_time: (Time.now - 4.days), end_time: (Time.now - 4.days + 2.hours)
te5 = TimeEntry.create start_time: (Time.now - 3.days), end_time: (Time.now - 3.days + 1.hour)
te6 = TimeEntry.create start_time: (Time.now - 2.days), end_time: (Time.now - 2.days + 1.hour)

te7 = TimeEntry.create start_time: (Time.now - 8.days), end_time: (Time.now - 8.days + 2.hours)
te8 = TimeEntry.create start_time: (Time.now - 9.days), end_time: (Time.now - 9.days + 1.hour)
te9 = TimeEntry.create start_time: (Time.now - 10.days), end_time: (Time.now - 10.days + 1.hour)
te10 = TimeEntry.create start_time: (Time.now - 11.days), end_time: (Time.now - 11.days + 2.hours)
te11 = TimeEntry.create start_time: (Time.now - 12.days), end_time: (Time.now - 12.days + 1.hour)
te12 = TimeEntry.create start_time: (Time.now - 13.days), end_time: (Time.now - 13.days + 1.hour)

puts "Time total count: #{TimeEntry.all.count}"

p1.users << u1 << u2
p2.users << u3 << u4

u4.time_entries  << te1 << te2 << te3 << te4 << te5 << te6
p2.time_entries  << te1 << te2 << te3 << te4 << te5 << te6

u1.time_entries  << te7 << te8 << te9 << te10 << te11 << te12
p2.time_entries  << te7 << te8 << te9 << te10 << te11 << te12
