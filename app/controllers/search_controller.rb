class SearchController < ApplicationController
  def index
  end

  def create
  
    keywords = params[:keywords]
    phrase = params[:phrase]
    @response = Array.new()
    
    if keywords == 'people'
      users = User.where("name like ?","%#{phrase}%")
      users.each do |user|
        @response.push(user)
      end
    elsif keywords == 'zim'
      zims = Zim.where("name like ?","%#{phrase}%")
      
      users.each do |user|
        @response.push(user)
      end
    end
    
    respond_to do |format|
      format.html {render json: @response,status: :ok}
      format.json {render json: @response,status: :ok}
    end    
  end
  
end
