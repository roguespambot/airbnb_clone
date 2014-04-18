class Rental < ActiveRecord::Base
  belongs_to :renter
  belongs_to :property
  has_one :rating
  has_one :owner, through: :property

  validate :start_date_in_future, :end_date_after_start_date, :property_available

  def start_date_in_future
    if self.start_date < Date.today
      errors.add(:start_date, " cannot be before today.")
      false
    else
      true
    end
  end

  def end_date_after_start_date
    if self.end_date > self.start_date
      true
    else
      errors.add(:end_date, " cannot be before start date.")
      false
    end
  end

  def property_available
    available = true
    Rental.where(:property_id => self.property_id).each do |rental|
      if (self.start_date.between?(rental.start_date, rental.end_date) || self.end_date.between?(rental.start_date, rental.end_date))
        available = false
      end
    end
    if !available
      errors.add(:start_date, "Dates are already taken.")
    end
    available
  end
end
