class User < ActiveRecord::Base
  has_many :subscriptions, dependent: :destroy
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email,uniqueness: true,format:{
    with: %r{\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z}i,
    message: 'must be a valid email format'
  }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}
  
  def User.digest(string)
    BCrypt::Password.create(string, cost:BCrypt::Engine::MIN_COST)
  end
  
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_digest = User.new_token
    update_attribute(:remember_digest,User.digest(remember_digest ))
  end
  
  def  authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
