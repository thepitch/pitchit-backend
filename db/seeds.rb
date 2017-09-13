# require 'Faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


### USER
User.create(
  first_name: "Kevin",
  last_name: "Kennis",
  email: "kevinvkennis@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars3.githubusercontent.com/u/12480403?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: "Outside of making things, I love travel, national parks, literature, the Giants, and specific, descriptive words - like 'ouroboros'."
  )


User.create(
  first_name: "Anne",
  last_name: "Chen",
  email: "annewchen@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars1.githubusercontent.com/u/12677813?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: "An enthusiastic software engineer passionate about efficiency, eager to contribute technical, organization, and communication skills to create applications with meaningful and smooth user experiences."
  )

User.create(
  first_name: "Galen",
  last_name: "Cook",
  email: "galenscook@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars0.githubusercontent.com/u/11188784?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: "Live out of your imagination, not your history."
  )

User.create(
  first_name: "Bison",
  last_name: "Hubert",
  email: "davidbison@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars1.githubusercontent.com/u/12518069?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: "In my projects, I try to incorporate at least one of these with my interest in sustainability, storytelling, and self-awareness."
  )

User.create(
  first_name: "Gael",
  last_name: "Bergeron",
  email: "g10n@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://pbs.twimg.com/profile_images/610613398565326848/Nra2X9Bc.jpg",
  company: "Dev Bootcamp",
  blurb: "ideas / young companies / music nudges"
  )

User.create(
  first_name: "Julia",
  last_name: "Graber",
  email: "graber.jay@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars0.githubusercontent.com/u/12245008?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: "developer, activist, artist"
  )

User.create(
  first_name: "Joie",
  last_name: "Kennerson",
  email: "josephkennerson@gmail.com",
  password: "password",
  phone: "555-555-5555",
  picture_url: "https://avatars2.githubusercontent.com/u/12093023?v=3&s=460",
  company: "Dev Bootcamp",
  blurb: "I am ready to fully commit to a dynamic, engaged team to build something unbelievable, meaningful and beautiful."
  )
### PITCHES
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
