class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant

  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships

  mount_uploader :avatar, AvatarUploader
  def admin?
    self.role == "admin"           
  end
  
  def following?(user)
    self.followings.include?(user)
  end

  
  before_save :initialize_name
  def initialize_name
    if self.name == '' || self.name == nil
      self.name = self.email.split('@').first
    end
  end

end
