module CurrentUser extend ActiveSupport::Concern

  private
  
  def set_user
    @user = User.find(session[:user_id])
  end
  
end