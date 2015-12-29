class PostcontentsController < ApplicationController
  before_action :set_postcontent, only: [:show, :edit, :update, :destroy]

  # GET /postcontents
  # GET /postcontents.json
  def index
    @postcontents = Postcontent.all
  end

  # GET /postcontents/1
  # GET /postcontents/1.json
  def show
  end

  # GET /postcontents/new
  def new
    @postcontent = Postcontent.new
  end

  # GET /postcontents/1/edit
  def edit
  end

  # POST /postcontents
  # POST /postcontents.json
  def create
    @postcontent = Postcontent.new(postcontent_params)

    respond_to do |format|
      if @postcontent.save
        format.html { redirect_to @postcontent, notice: 'Postcontent was successfully created.' }
        format.json { render :show, status: :created, location: @postcontent }
      else
        format.html { render :new }
        format.json { render json: @postcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postcontents/1
  # PATCH/PUT /postcontents/1.json
  def update
    respond_to do |format|
      if @postcontent.update(postcontent_params)
        format.html { redirect_to @postcontent, notice: 'Postcontent was successfully updated.' }
        format.json { render :show, status: :ok, location: @postcontent }
      else
        format.html { render :edit }
        format.json { render json: @postcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcontents/1
  # DELETE /postcontents/1.json
  def destroy
    @postcontent.destroy
    respond_to do |format|
      format.html { redirect_to postcontents_url, notice: 'Postcontent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postcontent
      @postcontent = Postcontent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def postcontent_params
      params.require(:postcontent).permit(:description, :media_url, :media_type, :post_id)
    end
end
