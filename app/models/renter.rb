class Renter < User
  has_many :rentals
  has_many :ratings
end
