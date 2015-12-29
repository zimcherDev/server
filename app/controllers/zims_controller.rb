class ZimsController < ApplicationController
  before_action :set_zim, only: [:show, :edit, :update, :destroy]

  # GET /zims
  # GET /zims.json
  def index
    @zims = Zim.all
  end

  # GET /zims/1
  # GET /zims/1.json
  def show
    response = {
      :name => @zim.name,
      :description => @zim.description,
      :image_url => @zim.image_url,
      :publicity => @zim.publicity,
      :num_members => @zim.subscriptions.count,
      :num_posts => @zim.posts.count,
      :posts => @zim.posts  
    }
    
    respond_to do |format|
      format.html {render json: response,status: :ok}
      format.json {render json: response,status: :ok}
    end
    
  end

  # GET /zims/new
  def new
    @zim = Zim.new
  end

  # GET /zims/1/edit
  def edit
  end

  # POST /zims
  # POST /zims.json
  def create
    @zim = Zim.new(zim_params)

    respond_to do |format|
      if @zim.save
        format.html { redirect_to @zim, notice: 'Zim was successfully created.' }
        format.json { render json: @zim, status: :created}
      else
        format.html { render :new }
        format.json { render json: @zim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zims/1
  # PATCH/PUT /zims/1.json
  def update
    respond_to do |format|
      if @zim.update(zim_params)
        format.html { redirect_to @zim, notice: 'Zim was successfully updated.' }
        format.json { render json: @zim, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @zim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zims/1
  # DELETE /zims/1.json
  def destroy
    @zim.destroy
    respond_to do |format|
      format.html { redirect_to zims_url, notice: 'Zim was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zim
      @zim = Zim.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zim_params
      params.require(:zim).permit(:name, :description, :image_url, :publicity)
    end
end
