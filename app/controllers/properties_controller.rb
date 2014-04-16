class PropertiesController < ApplicationController
  def new
    @property = Property.new
    @user = current_user
  end

  def create
    @property = Property.new(property_params)
    @user = current_user
    if @property.save
      respond_to do |format|
        format.html { redirect_to user_path(@property.user) }
        format.js
      end
    else
      flash[:alert] = "Caution! Your property has not saved!"
      render ('users/show.html.erb')
    end
  end

private
  def property_params
    params.require(:property).permit(:title, :address, :description, :bedrooms, :long_term, :price)
  end
end
