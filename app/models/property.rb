class Property < ActiveRecord::Base
  has_many :rentals
  has_many :ratings, through: :rentals
  belongs_to :owner

  private

  def self.search(search)
    if search
      Property.basic_search(search)
    end
  end
end
