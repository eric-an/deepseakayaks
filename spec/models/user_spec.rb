require 'rails_helper'

describe User do

  context "when the product has a name" do
    
    before do
    	@user = FactoryGirl.create(:user)
    end

    it "should return an valid product entry" do
    	expect(@user).to be_valid
    end
  end

end