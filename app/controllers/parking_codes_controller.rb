class ParkingCodesController < ApplicationController
  before_action :set_parking_code, only: [:show, :edit, :update, :destroy]

  # GET /parking_codes
  # GET /parking_codes.json
  def index
    @parking_codes = ParkingCode.all
  end

  # GET /parking_codes/1
  # GET /parking_codes/1.json
  def show
  end

  # GET /parking_codes/new
  def new
    @parking_code = ParkingCode.new
  end

  # GET /parking_codes/1/edit
  def edit
  end

  # POST /parking_codes
  # POST /parking_codes.json
  def create
    @parking_code = ParkingCode.new(parking_code_params)

    respond_to do |format|
      if @parking_code.save
        format.html { redirect_to @parking_code, notice: 'Parking code was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parking_code }
      else
        format.html { render action: 'new' }
        format.json { render json: @parking_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_codes/1
  # PATCH/PUT /parking_codes/1.json
  def update
    respond_to do |format|
      if @parking_code.update(parking_code_params)
        format.html { redirect_to @parking_code, notice: 'Parking code was successfully updated.' }
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
    @parking_code.destroy
    respond_to do |format|
      format.html { redirect_to parking_codes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_code
      @parking_code = ParkingCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_code_params
      params.require(:parking_code).permit(:code, :codedate)
    end
end
