class TextDataController < ApplicationController
  before_action :set_text_data, only: [:show, :edit, :update, :destroy]

  @text_data = TextData.all

end
