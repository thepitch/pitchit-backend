# require 'Faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### USER x 25
25.times do
  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: Faker::Internet.password(8),
      phone: Faker::PhoneNumber.cell_phone,
      picture_url: Faker::Avatar.image,
      company: Faker::Company.name,
      blurb: Faker::Hacker.say_something_smart
    )
end
### EXTERNAL LINKS x 50
50.times do
  ExternalLink.create(
    url: Faker::Internet.url,
    linkable_id: rand(1..25),
    linkable_type: ["User", "Pitch"].sample
  )
end
### PITCHES x 25
25.times do
  Pitch.create(
    title: Faker::Name.title,
    tagline: Faker::Hacker.say_something_smart,
    description: Faker::Lorem.paragraph,
    media: "https://www.youtube.com/watch?v=CdqoNKCCt7A",
    user_id: rand(1..25)
  )
end
### Comments x 25
25.times do
  Comment.create(
    content: Faker::Lorem.paragraph,
    pitch_id: rand(1..25),
    user_id: rand(1..25)
  )
end
### subcomments x50
50.times do
  Subcomment.create(
    content: Faker::Lorem.paragraph,
    comment_id: rand(1..25),
    user_id: rand(1..25)
  )
end
### votes x100
100.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: ["Pitch", "Comment"].sample,
    votable_id: rand(1..25),
    bookmarked: false
  )
end
