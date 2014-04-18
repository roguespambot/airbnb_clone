require 'spec_helper'

describe Calendar do
  describe '.available' do
    it 'checks if a property is available for rental on a specific day' do
      property = FactoryGirl.create(:property)
      rental = FactoryGirl.create(:rental1, :property_id => property.id)
      Calendar.available(20, property).should eq false
    end
  end
end
