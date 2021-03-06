require 'rails_helper'

describe Comment do

  context "when the comment is fully filled out" do

  	before do
  		@comment = FactoryGirl.create(:comment)
  	end

  	it "should return an valid comment entry" do
  		expect(@comment).to be_valid
  	end
  end

end


# Alternative method:

# require 'rails_helper'

# describe Comment do

#   context "when the comment is not fully filled out" do

#     before do
#       @product = Product.create(:name => "electric car")
#       @user = User.create(:email => "testing@email.com", :password => "pw1234" )
#       @comment = Comment.create(:body => "This is my comment.", 
#                                   :user => @user, 
#                                   :rating => 4,
#                                   :product => @product)
#     end

#     it "should return an valid comment entry" do
#       expect(@comment).to be_valid
#     end
#   end

# end