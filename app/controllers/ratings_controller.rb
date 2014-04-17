class RatingsController < ApplicationController
  def index
    @rating = Rating.new
  end

  def new
    @rating = Rating.new
    @rental = Rental.find(params[:rental_id])
  end

  def create
    @rating = Rating.new(rating_params)
    @rental = Rental.find(params[:rental_id])
    if @rating.save
       respond_to do |format|
        format.html { redirect_to rentals_path(current_user) }
        format.js
      end
    else
      flash[:alert] = "Rating not saved."
      redirect_to rentals_path(current_user)
    end
  end

private
  def rating_params
    params.require(:rating).permit(:value, :rental_id)
  end
end
