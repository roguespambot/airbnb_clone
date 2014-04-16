class Rating < ActiveRecord::Base
  belongs_to :renter
  belongs_to :rental
  belongs_to :property, through: :rental
end
