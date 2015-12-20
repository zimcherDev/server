class MyzimsController < ApplicationController
  before_action :set_user, only: [:index]

  def index
     
    subscriptions = @user.subscriptions
    
    @zims = Array.new() 
    
    subscriptions.each do |subscription|
      @zims.push(subscription.zim)
    end
    
    respond_to do |format|
      format.html {render action: 'index'}
      format.json {render json: @zims}
    end
  end
  
  private 
    def set_user
      @user = User.find(params[:id])
    end   
end

