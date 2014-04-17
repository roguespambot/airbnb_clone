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
end
