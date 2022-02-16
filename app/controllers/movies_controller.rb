class MoviesController < ApplicationController
  def index
    @movies = Movie.all.includes(:actors).order(average_rating: :desc)
  end
end
