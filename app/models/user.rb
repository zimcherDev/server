class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true
  validates :email,uniqueness: true,format:{
    with: %r{\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z}i,
    message: 'must be a valid email format'
  }
  validates :image_url, allow_blank: true,format:{
    with: %r{\.(gif|jpg|png)\Z}i,
    messsage: 'must be a URL for GIF,JPG or PNG image'
  }
  has_secure_password
end
