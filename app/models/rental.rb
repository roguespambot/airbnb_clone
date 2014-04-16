class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :property
  belongs_to :rating
  has_one :owner, through: :property
end
