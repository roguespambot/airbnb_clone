require 'spec_helper'

describe Property do
  describe 'average_rating' do
    it 'averages all ratings from all rentals for a property' do
      property = FactoryGirl.create(:property)
      rental1 = FactoryGirl.create(:rental1, :property_id => property.id)
      rental2 = FactoryGirl.create(:rental2, :property_id => property.id)
      rating1 = FactoryGirl.create(:rating1, :rental_id => rental1.id)
      rating2 = FactoryGirl.create(:rating2, :rental_id => rental2.id)
      property.average_rating.should eq 5.0
    end
    it 'does not break if there are no ratings' do
      property = FactoryGirl.create(:property)
      rental1 = FactoryGirl.create(:rental1, :property_id => property.id)
      rental2 = FactoryGirl.create(:rental2, :property_id => property.id)
      property.average_rating.should eq 0
    end
  end

  describe '.order_by_rating' do
    it 'returns an array of all properties ordered by average rating' do
      property1 = FactoryGirl.create(:property)
      property2 = FactoryGirl.create(:property)
      rental1 = FactoryGirl.create(:rental1, :property_id => property1.id)
      rental2 = FactoryGirl.create(:rental2, :property_id => property1.id)
      rating1 = FactoryGirl.create(:rating1, :rental_id => rental1.id)
      rating2 = FactoryGirl.create(:rating2, :rental_id => rental2.id)
      rental3 = FactoryGirl.create(:rental1, :property_id => property2.id)
      rental4 = FactoryGirl.create(:rental2, :property_id => property2.id)
      rating3 = Rating.create(:value => 10, :rental_id => rental3.id)
      rating4 = Rating.create(:value => 8, :rental_id => rental4.id)
      Property.order_by_rating.should eq [property2, property1]
    end
  end
  describe '.available' do
    it 'returns an array of all properties ordered by average rating' do
      property1 = FactoryGirl.create(:property)
      property2 = FactoryGirl.create(:property)
      property1.update(:rented => true)
      Property.available.should eq [property2]
    end
  end

  describe '#check_date' do
    it 'checks if the property is available on a given date' do
      property = FactoryGirl.create(:property)
      rental = FactoryGirl.create(:rental1, :property_id => property.id)
      property.check_date(Date.today).should eq false
    end
  end
end
