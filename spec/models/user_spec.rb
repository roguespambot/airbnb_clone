require 'spec_helper'

describe User do

  it { should validate_presence_of :username }
  it { should validate_uniqueness_of :username }

  describe 'properties' do
    it 'returns an array of all properties owned by the user' do
      owner = FactoryGirl.create(:user)
      property1 = FactoryGirl.create(:property)
      property2 = FactoryGirl.create(:property)
      property1.update(owner_id: owner.id)
      property2.update(owner_id: owner.id)
      owner.properties.length.should eq 2
    end

    it "doesn't break when the user has no properties" do
      owner = FactoryGirl.create(:user)
      owner.properties.length.should_not eq nil
    end
  end
end
