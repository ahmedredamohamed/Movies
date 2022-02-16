class ActorsController < ApplicationController
  def search
    relation = Actor.includes(:movies)
    if params[:query].blank?  # blank? covers both nil and empty string
      relation = relation.all
    else
      relation = relation.where('name LIKE ?', "%#{params[:query]}%")
    end
    @actors = relation
  end
end
