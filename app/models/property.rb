class Property < ActiveRecord::Base
  has_many :rentals
  has_many :ratings, through: :rentals
  belongs_to :owner

  def average_rating
    total = 0
    if self.rentals
      self.rentals.each  do |rental|
        if rental.rating
          total += rental.rating.value
        end
      end
      average = total / self.rentals.length
    else
      average = 0
    end
  end

private

  def self.search(search)
    if search
      Property.basic_search(search)
    end
  end
end
