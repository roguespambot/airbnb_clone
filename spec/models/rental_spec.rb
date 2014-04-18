require 'spec_helper'

describe Rental do
  describe 'start_date_in_future' do
    it 'verifies that a new rental start date is today or in the future' do
      rental = FactoryGirl.build(:rental1)
      rental.start_date_in_future.should eq true
    end
  end

  describe 'end_date_after_start_date' do
    it "returns true if the end date is after the start date" do
      rental = FactoryGirl.build(:rental1)
      rental.end_date_after_start_date.should eq true
    end
    it "returns false if the end date is equal to or before the start date" do
      rental = FactoryGirl.build(:rental3)
      rental.end_date_after_start_date.should eq false
    end
  end

  describe 'property_available' do
    it "returns true if the start and end dates of a rental are not claimed by another rental" do
      rental = FactoryGirl.create(:rental1)
      good_rental = FactoryGirl.build(:rental4)
      good_rental.property_available.should eq true
    end
    it "returns false if the dates are the same as those claimed by another rental" do
      rental = FactoryGirl.create(:rental1)
      bad_rental = FactoryGirl.build(:rental1)
      bad_rental.property_available.should eq false
    end
    it "returns false if the start date is during another rentals claimed period" do
      rental = FactoryGirl.create(:rental1)
      bad_rental = FactoryGirl.build(:rental1, :end_date => Date.tomorrow.tomorrow)
      bad_rental.property_available.should eq false
    end
    it "returns false if the end date is during another rentals claimed period" do
      rental = FactoryGirl.create(:rental1)
      bad_rental = FactoryGirl.build(:rental1, :start_date => Date.yesterday)
      bad_rental.property_available.should eq false
    end
  end
end
