class Product < ActiveRecord::Base
	has_many :orders
	has_many :comments

	def average_rating
		comments.average(:rating).to_f
	end

	# number of Product sold
	def scored(sold)
    if sold > self.high_score
      $redis.zadd("highscores", sold, self.id)
    end
  end
  
	# rank (popularity) of product
  def rank
    $redis.zrevrank("highscores", self.id) + 1
  end
  
	# highest number of Product sold
  def high_score
    $redis.zscore("highscores", self.id).to_i
  end
  
  # top three Products sold
  def self.top_3
    $redis.zrevrange("highscores", 0, 2).map{|id| Product.find(id)}
  end

	validates :name, presence: true
	  validates :description, presence: true
	  validates :image_url, presence: true
	  validates :colour, presence: true
    validates :price, presence: true

end
