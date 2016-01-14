require 'rails_helper'

describe UsersController, :type => :controller do
  
    before do
    	@user = FactoryGirl.create(:user, :email => "test@email.com", :password => "test1234", :first_name => "Sigmund", :last_name => "Freud")
    	@userTwo = FactoryGirl.create(:user, :email => "testTWO@email.com", :password => "test5678", :first_name => "Peabody", :last_name => "Sherman")
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