class Review < ApplicationRecord

  after_save :update_movie_average_rating

  belongs_to :movie

  def update_movie_average_rating
    self.movie.average_rating = self.movie.reviews.average(:stars)
    self.movie.save!
  end
end
