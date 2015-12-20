require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def new_user(email)
    User.new(name: 'King',
             email: email,
             image_url: 'king.jpg',
             password: '123',
             password: '123')   
  end
  
  test "email format" do
    ok = %w{ 123@gmail.com allen-king@123.com will_jyp@126.com a123@yahoo.com}
    bad = %w{ kk@ jyp@@.com 123abc 123@abc google.com my@.com}
    
    ok.each do |email|
      assert new_user(email).valid?, "#{email} should be valid"
    end
    
    bad.each do |email|
      assert new_user(email).invalid? "#[email] shouldn't be valid"
    end
  end
end
