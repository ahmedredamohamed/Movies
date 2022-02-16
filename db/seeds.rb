# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'movies.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  movie = Movie.find_or_initialize_by(name: row['Movie'])

  movie.assign_attributes(
    description: row['Description'],
    year: row['Year'],
    director: row['Director'],
    filming_location: row['Filming location'],
    country: row['Country']
  )
  actor = Actor.find_or_initialize_by(name: row['Actor'])

  movie.save!
  actor.save!
  actor_movie = ActorMovie.find_or_initialize_by(actor: actor, movie: movie)
  actor_movie.save!
end

csv_text = File.read(Rails.root.join('lib', 'seeds', 'reviews.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  movie = Movie.find_by(name: row['Movie'])
  review = movie.reviews.find_or_initialize_by(
    user: row['User'],
    stars: row['Stars'],
    body: row['Review']
  )
  review.save!
end