class Post < ActiveRecord::Base
    has_many :comments
    belongs_to :user
    belongs_to :topic
    
    default_scope { order('created_at DESC')} # scope declaration will order all posts by their created_at date, in descending order.
end
