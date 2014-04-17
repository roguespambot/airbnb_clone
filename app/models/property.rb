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
      if total != 0
        average = total / self.rentals.length
      else
        average = 0
      end
    end
  end

  def self.order_by_rating
    Property.all.sort { |a,b| b.average_rating <=> a.average_rating }
  end

  def self.available
    Property.all.where(:rented => false)
  end

private

  def self.search(search)
    if search
      Property.basic_search(search)
    end
  end
end
