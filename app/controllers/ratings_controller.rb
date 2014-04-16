class RatingsController < ApplicationController
  def index
    @rating = Rating.new
  end

  def new
    @rating = Rating.new
    @rental = Rental.find(params[:rental_id])
  end

end
