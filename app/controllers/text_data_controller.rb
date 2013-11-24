class TextDataController < ApplicationController
  before_action :set_text_data, only: [:show, :edit, :update, :destroy]

  # GET /text_data
  # GET /text_data.json
  def index
    @text_data = TextData.all
  end

  # GET /text_data/1
  # GET /text_data/1.json
  def show
  end

  # GET /text_data/new
  def new
    @text_data = TextData.new
  end

  # GET /text_data/1/edit
  def edit
  end

  # POST /text_data
  # POST /text_data.json
  def create
    @text_data = TextData.new(text_data_params)

    respond_to do |format|
      if @text_data.save
        format.html { redirect_to @text_data, notice: 'Text data was successfully created.' }
        format.json { render action: 'show', status: :created, location: @text_data }
      else
        format.html { render action: 'new' }
        format.json { render json: @text_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /text_data/1
  # PATCH/PUT /text_data/1.json
  def update
    respond_to do |format|
      if @text_data.update(text_data_params)
        format.html { redirect_to @text_data, notice: 'Text data was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @text_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /text_data/1
  # DELETE /text_data/1.json
  def destroy
    @text_data.destroy
    respond_to do |format|
      format.html { redirect_to text_data_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text_data
      @text_data = TextData.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_data_params
      params[:text_data]
    end
end
