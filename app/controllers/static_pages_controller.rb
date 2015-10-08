class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
  	@products = Product.limit(4)
  	@featured_product = Product.first
  	@productlist = Product.find([1,2,3,4])
  end

  def thank_you
  	@name = params[:name]
  	@email = params[:email]
  	@message = params[:message]
  	UserMailer.contact_form(@email, @name, @message).deliver
  end
end
