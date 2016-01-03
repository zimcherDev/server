class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :uploadImage]
  require 'aws-sdk'
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new
    
    @user.name = user_params[:name]
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    @user.password_confirmation = user_params[:password_confirmation]

    respond_to do |format|
      if @user.save
      
        if user_params[:picture]
          uploaded_io = user_params[:picture]
          s3 = Aws::S3::Resource.new(
            credentials: Aws::Credentials.new('AKIAJAE7VUWCVE6MJZTA ', 'IKIwmRHirTwvre4OacyNJgNXntSv3tKZSNxxSeTZ'),
            region: 'us-west-2')
            
          obj = s3.bucket('zimcher').object("usersimages/#{@user.id}")
          obj.put(body: uploaded_io)
          @user.image_url = obj.public_url
          @user.save
        end
      
        format.html { redirect_to myzim_path(id: @user), notice: "User #{@user.name} was successfully created." }
        format.json { render json: @user, status: :created}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  
    if user_params[:picture]
      uploaded_io = user_params[:picture]
      s3 = Aws::S3::Resource.new(
        credentials: Aws::Credentials.new('AKIAJAE7VUWCVE6MJZTA ', 'IKIwmRHirTwvre4OacyNJgNXntSv3tKZSNxxSeTZ'),
        region: 'us-west-2')
            
      obj = s3.bucket('zimcher').object("usersimages/#{@user.id}")
      obj.put(body: uploaded_io)
      @user.image_url = obj.public_url
    end
    
    @user.name = user_params[:name]
    @user.email = user_params[:email]
    @user.password = user_params[:password]
    @user.password_confirmation = user_params[:password_confirmation]
    
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: "User #{@user.name} was successfully updated." }
        format.json { render json: @user, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :picture)
    end
end
