class Property < ActiveRecord::Base
  has_many :rentals
  has_many :ratings, through: :rentals
  belongs_to :owner
end
