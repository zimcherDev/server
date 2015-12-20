class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    respond_to do |format|     
      if user and user.authenticate(params[:password])
        format.html { redirect_to myzims_path(id: user), notice: 'User was successfully updated.' }
        format.json { render json: user }
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
