class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :zim
  
  validates :user,uniqueness: {scope: :zim,
    message: 'You have subscribed this zim'}
end
