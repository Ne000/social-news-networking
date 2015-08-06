class Topic < ActiveRecord::Base
    has_many :posts, dependent: :destroy #delete any dependent posts when a topic is deleted.

    scope :visible_to, -> (user) { user ? all : where(public: true) } # depending on if user is signed in or not, topic_collection.all or topic_collection.where(public: true)

end
