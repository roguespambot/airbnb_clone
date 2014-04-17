class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :property
  has_one :rating
  has_one :owner, through: :property

end
