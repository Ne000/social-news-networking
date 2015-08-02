class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :post
  
  
    validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote." }
    
    after_save :update_post #will run everytime a vote is saved
    
    private
    
    def update_post
        post.update_rank #update_rank defined in post.rb
    end
	
end
