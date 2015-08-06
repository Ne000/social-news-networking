class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :posts, dependent: :destroy
  
  has_many :comments, dependent: :destroy
  
  has_many :votes, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader
  
  
  def admin?
    role == 'admin'
  end
  
  def moderator?
    role == 'moderator'
  end
  
  def favorited(post) #takes a post object and returns a favorite object, if one exists
    favorites.where(post_id: post.id).first #if entry in favorites table with user_id and post_id
  end
  
end