require 'rails_helper'

describe Product do
	
	context "when the product has comments" do

	  before do
	    @product = Product.create(:name => "electric car")
	    @user = User.create(:email => "testing@email.com", :password => "pw1234" )
	    @product.comments.create(:rating => 1, :user => @user, :body => 
	    	"Eh, not cool.") 
	    @product.comments.create(:rating => 3, :user => @user, :body => "Decent.")
	    @product.comments.create(:rating => 5, :user => @user, :body => "Fabulous.")
	  end

	  it "returns the average rating of all comments" do
	  	expect(@product.comments.average(:rating)).to eq 3
	  end
  end

  context "when the product has no name" do
    
    before do
    	@product = Product.create(:description => "This is a family car.")
    end

    it "should return an invalid product entry" do
    	expect(@product).not_to be_valid
    end
  end

end