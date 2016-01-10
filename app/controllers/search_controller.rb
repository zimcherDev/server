class SearchController < ApplicationController
  def index
    @response = params[:response]
  end

  def create
  
    object = params[:object]
    keyword = params[:keyword]
    @response = Array.new()
    
    if object == 'people'
      users = User.where("name like ?","%#{keyword}%")
      users.each do |user|
        user_info = {
          :name => user.name,
          :image_url => user.image_url,
          :num_posts => user.posts.count
        }
        @response.push(user_info)
      end
    elsif object == 'zim'
      zims = Zim.where("name like ?","%#{keyword}%")
      
      zims.each do |zim|
        zim_info = {
          :name => zim.name,
          :description => zim.description,
          :image_url => zim.image_url,
          :num_members => zim.subscriptions.count,
          :num_posts => zim.posts.count
        }
        @response.push(zim_info)
      end
    end
    
    respond_to do |format|
      format.html {render json: @response,status: :ok}
      format.json {render json: @response,status: :ok}
    end    
  end
  
end
