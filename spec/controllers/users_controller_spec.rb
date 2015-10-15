require 'rails_helper'

describe UsersController, :type => :controller do
  
    before do
    	@user = User.create(:email => "test@email.com", :password => "test1234")
    	@userTwo = User.create(:email => "testTWO@email.com", :password => "test5678")
    end 

    describe "GET #show" do
      	
      	context "User is logged in" do
      		before do
      			sign_in @user
      		end

      		it "loads correct user details" do
      			get :show, id: @user.id
      			expect(response).to have_http_status(200)
      			expect(assigns(:user)).to eq @user
      	  end

      	  it "cannot access userTwo details" do
      	  	get :show, id: @userTwo.id
      	  	expect(response).to redirect_to(root_path)
      	  	expect(response).to have_http_status(302)
      	  end
        end

        context "No User is logged in" do
        	it "redirects to login" do
        		get :show, id: @user.id
        		expect(response).to redirect_to(root_path)
        	end
        end
    end
end