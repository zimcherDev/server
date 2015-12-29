class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email,uniqueness: true,format:{
    with: %r{\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z}i,
    message: 'must be a valid email format'
  }
  has_secure_password
end
