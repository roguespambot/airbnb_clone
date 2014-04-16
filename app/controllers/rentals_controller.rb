class RentalsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]

  def index
    @user = current_user
    @rentals = @user.rentals
  end

  def new
    @rental = Rental.new
    @property = Property.find(params[:property_id])
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      @rental.property.update(rented: true)
      respond_to do |format|
        format.html { redirect_to property_path(@rental.property) }
        format.js
      end
    else
      flash[:alert] = "Caution! There was a problem with your rental application!"
      redirect_to property_path(@rental.property)
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:property_id, :renter_id, :start_date, :end_date, :price_paid)
  end
end
