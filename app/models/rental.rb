class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :property
  belongs_to :rating
  belongs_to :owner, through: :property
end
