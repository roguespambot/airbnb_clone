class Rating < ActiveRecord::Base
  belongs_to :renter
  belongs_to :rental
  has_one :property, through: :rental
end
