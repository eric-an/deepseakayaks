class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders

	validates :first_name, presence: true
	validates :last_name, presence: true
	

  after_create :send_admin_mail
  def send_admin_mail
  	UserMailer.welcome_email(self).deliver_later
  end

end