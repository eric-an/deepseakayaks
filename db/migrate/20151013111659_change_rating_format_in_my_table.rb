class ChangeRatingFormatInMyTable < ActiveRecord::Migration
  def change
  	def up
  		change_column :comments, :rating, :integer
  	end

  	def down
  		change_column :comments, :rating, :string
  	end
  end
end
