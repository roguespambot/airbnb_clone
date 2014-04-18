class HomesController < ApplicationController
  def index
  end

  def show
    @property = Property.find(1)
  end
end
