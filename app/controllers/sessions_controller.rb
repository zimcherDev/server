class SessionsController < ApplicationController

  def new   
    if(user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user 
       redirect_to myzim_path(id: user)
      end
    end
    
  end

  def create
    user = User.find_by(email: params[:email])
    respond_to do |format|     
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
        
        if params[:remember_me] == 'on'
          cookies.permanent.signed[:user_id] = user.id
        end
        
        format.html { redirect_to myzim_path(id: user) }
        format.json { render json: user,status: :ok }
      else
        format.html { redirect_to login_url ,alert: 'Invalid user/password combination'}
        format.json { render json:{
          error: "Invalid user/password combination"
        },status: :unprocessable_entity}
      end
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:user_id)
    redirect_to zimcher_url, notice: "Logged out"
  end

end
