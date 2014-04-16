class Owner < User
  has_many :properties
  has_many :rentals, through: :properties
end
