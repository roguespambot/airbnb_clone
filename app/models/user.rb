class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, uniqueness: true

  def properties
    owner = Owner.find(self.id)
    owner.properties
  end

  def rentals
    renter = Renter.find(self.id)
    renter.rentals
  end
end
