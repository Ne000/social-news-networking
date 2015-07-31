class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy #delete any dependent posts when a topic is deleted.
end
