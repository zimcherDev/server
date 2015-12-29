class Zim < ActiveRecord::Base
  has_many :subscriptions
  has_many :posts, dependent: :destroy
  
  before_destroy :ensure_not_referenced_by_any_subscription
  
  private
  
  def ensure_not_referenced_by_any_subscription
    if subscriptions.empty?
      return true
    else
      errors.add(:base,'Subscription present')
      return false
    end
  end
end
