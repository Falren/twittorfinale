class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :passive_friendships, foreign_key: :followed_id, class_name: 'Friendship'
  has_many :followers, through: :passive_friendships, source: :follower

  has_many :active_friendships, foreign_key: :follower_id, class_name: 'Friendship'
  has_many :followings, through: :active_friendships, source: :followed

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
