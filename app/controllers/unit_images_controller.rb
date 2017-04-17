class UnitImagesController < ApplicationController
  before_action :set_unit_image, only: [:show, :edit, :update, :destroy]

  # GET /unit_images
  # GET /unit_images.json
  def index
    @unit_images = UnitImage.all
  end

  # GET /unit_images/1
  # GET /unit_images/1.json
  def show
  end

  # GET /unit_images/new
  def new
    @unit_image = UnitImage.new
  end

  # GET /unit_images/1/edit
  def edit
  end

  # POST /unit_images
  # POST /unit_images.json
  def create
    @unit_image = UnitImage.new(unit_image_params)

    respond_to do |format|
      if @unit_image.save
        format.html { redirect_to @unit_image, notice: 'Unit image was successfully created.' }
        format.json { render :show, status: :created, location: @unit_image }
      else
        format.html { render :new }
        format.json { render json: @unit_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unit_images/1
  # PATCH/PUT /unit_images/1.json
  def update
    respond_to do |format|
      if @unit_image.update(unit_image_params)
        format.html { redirect_to @unit_image, notice: 'Unit image was successfully updated.' }
        format.json { render :show, status: :ok, location: @unit_image }
      else
        format.html { render :edit }
        format.json { render json: @unit_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_images/1
  # DELETE /unit_images/1.json
  def destroy
    @unit_image.destroy
    respond_to do |format|
      format.html { redirect_to unit_images_url, notice: 'Unit image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unit_image
      @unit_image = UnitImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unit_image_params
      params.require(:unit_image).permit(:unit_id, :url, :name)
    end
end
