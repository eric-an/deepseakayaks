class UpdateTypeCastOfRatings < ActiveRecord::Migration
	def change
		drop_table :comments
	  create_table :comments do |t|
	    t.references :user, index: true
	    t.text :body
	    t.integer :rating
	    t.references :product, index: true
	    t.timestamps
	  end
	end
end