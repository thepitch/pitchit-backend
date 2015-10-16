# require 'Faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### USER x 25
User.create(
  first_name: "Kevin",
  last_name: "Kennis",
  email: "kevinvkennis@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars3.githubusercontent.com/u/12480403?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )


User.create(
  first_name: "Anne",
  last_name: "Chen",
  email: "annewchen@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars1.githubusercontent.com/u/12677813?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )

User.create(
  first_name: "Galen",
  last_name: "Cook",
  email: "galenscook@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars0.githubusercontent.com/u/11188784?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )

User.create(
  first_name: "Bison",
  last_name: "Hubert",
  email: "davidbison@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars1.githubusercontent.com/u/12518069?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )

User.create(
  first_name: "Gael",
  last_name: "Bergeron",
  email: "g10n@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://pbs.twimg.com/profile_images/610613398565326848/Nra2X9Bc.jpg",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )

User.create(
  first_name: "Julia",
  last_name: "Graber",
  email: "juliagra@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars0.githubusercontent.com/u/12245008?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )

User.create(
  first_name: "Joie",
  last_name: "Kennerson",
  email: "josephkennerson@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars2.githubusercontent.com/u/12093023?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: Faker::Hacker.say_something_smart
  )

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
Pitch.create(
  title: "PitchIt",
  tagline: "How do you know if you have a good idea? Pitch it!",
  description: "Your first focus group. Enough said.",
  media: "https://www.youtube.com/watch?v=-YtYIj8-ezQ",
  user_id: 1,
  )


Pitch.create(
  title: "Restaurant Roulette",
  tagline: "Hangry - When you are so hungry that your lack of food causes you to become angry, frustrated or both. Welcome Team Restaurant Roulette!",
  description: "Allowing groups to make a quick restaurant choice. Every member of the group gets to vote on two specific preferences for a restaurant (example: affordable, vegetarian options, accepts credit cards, etc). App will take the majority preferences into consideration and return a random restaurant from the pre-filtered pool of restaurants.",
  media: "https://www.youtube.com/watch?v=fM8jqcHcYBI",
  user_id: 2,
  )

Pitch.create(
  title: "Track My Truck",
  tagline: "And if you're still thinking about lunch, let TrackMyTruck guide you.",
  description: "Feature missing from yelp. Food trucks are mobile, yelp is built for static locations. In SF they are stationary, but EVERYWHERE else you can never find them. Some tweet, others update a website. This brings all the foodtruck info to one place and links it to yelp for reviews",
  media: "https://www.youtube.com/watch?v=CHAu-RRm6Dw",
  user_id: 3,
  )

Pitch.create(
  title: "Generocity",
  tagline: "A convenient way to help people in need.",
  description: "We're kinda quiet, but we want to help people.",
  media: "https://www.youtube.com/watch?v=_I5qr6yRDM4",
  user_id: 4,
  )

Pitch.create(
  title: "Crowdj.io",
  tagline: "The way crowds listen to music.",
  description: "We're kinda quiet, but we want to help people.",
  media: "https://www.youtube.com/watch?v=MB-kWVLjPWw",
  user_id: 5,
  )

Pitch.create(
  title: "DecideIt",
  tagline: "We did three final projects instead of one!",
  description: "We're kinda quiet, but we want to help people.",
  media: "https://www.youtube.com/watch?v=mdeqQV7b8cQ",
  user_id: 6,
  )

Pitch.create(
  title: "Clutch",
  tagline: "Do new things. Meet new people. Come in clutch.",
  description: "We're kinda quiet, but we want to help people.",
  media: "https://www.youtube.com/watch?v=PQq57PEQ31E",
  user_id: 7,
  )


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
    votable_id: rand(8..25),
    bookmarked: false
  )
end

450.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 1,
    bookmarked: false
  )
end

449.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 2,
    bookmarked: false
  )
end

448.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 3,
    bookmarked: false
  )
end

447.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 4,
    bookmarked: false
  )
end

446.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 5,
    bookmarked: false
  )
end

445.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 6,
    bookmarked: false
  )
end

444.times do
  Vote.create(
    user_id: rand(1..25),
    votable_type: "Pitch",
    votable_id: 7,
    bookmarked: false
  )
end

1000.times do
  Comment.create(
    content: Faker::Hacker.say_something_smart,
    pitch_id: rand(1..7),
    user_id: rand(1..7)
  )
end