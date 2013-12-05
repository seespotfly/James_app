class TextDataController < ApplicationController
  before_action :set_text_datum, only: [:show, :edit, :update, :destroy]

  # GET /parking_codes
  # GET /parking_codes.json
  def index
    @text_data = ParkingCode.all
  end

  # GET /parking_codes/1
  # GET /parking_codes/1.json
  def show
  end

  # GET /parking_codes/new
  def new
    @text_data = ParkingCode.new
  end

  # GET /text_data/1/edit
  def edit
  end

  # POST /parking_codes
  # POST /parking_codes.json
  def create
    @text_datum = ParkingCode.new(text_datum_params)

    respond_to do |format|
      if @text_datum.save
        format.html { redirect_to @text_datum, notice: 'Parking code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @text_datum }
      else
        format.html { render action: 'new' }
        format.json { render json: @text_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_codes/1
  # PATCH/PUT /parking_codes/1.json
  def update
    respond_to do |format|
      if @text_datum.update(text_datum_params)
        format.html { redirect_to @text_datum, notice: 'Parking code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parking_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_codes/1
  # DELETE /parking_codes/1.json
  def destroy
    @text_datum.destroy
    respond_to do |format|
      format.html { redirect_to text_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_datum
      @text_datum = ParkingCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_datum_params
      params.require(:text_datum).permit(:code, :codedate)
    end
end