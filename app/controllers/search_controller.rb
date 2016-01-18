class SearchController < ApplicationController
  def index
    
  end

  def create
  
    object = params[:object]
    keyword = params[:keyword]
    @response = Array.new()
        
    if object == 'people'
      users = User.where("name like ?","%#{keyword}%")
      users.each do |user|
        user_info = {
          :id => user.id,
          :name => user.name,
          :image_url => user.image_url,
          :description => user.description,
          :num_posts => user.posts.count
        }
        @response.push(user_info)
      end
    elsif object == 'zim'
      zims = Zim.where("name like ?","%#{keyword}%")
      
      zims.each do |zim|
        zim_info = {
          :id => zim.id,
          :name => zim.name,
          :description => zim.description,
          :image_url => zim.image_url,
          :num_posts => zim.posts.count
        }
        @response.push(zim_info)       
      end
    end
    
    respond_to do |format|
      format.html {render :result,status: :ok}
      format.json {render json: @response,status: :ok}
    end    
  end
  
  def result
    
  end
end
