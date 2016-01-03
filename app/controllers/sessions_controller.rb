class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    respond_to do |format|     
      if user and user.authenticate(params[:password])
        session[:user_id] = user.id
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
  end

end
