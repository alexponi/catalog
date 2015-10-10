class TextsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_text, only: [:edit, :update, :destroy]
  before_action :set_thing, only: [:new, :create, :edit, :update, :destroy]

  def new
    @text = Text.new
  end

  def edit
  end

  def create
    @text = Text.new(text_params)

    respond_to do |format|
      if @text.save
        ThingText.create(thing_id: params[:thing_id], text_id: @text.id)
        format.html { redirect_to @thing, notice: 'Text was successfully created.' }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to @thing, notice: 'Text was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @text.destroy
    respond_to do |format|
      format.html { redirect_to @thing, notice: 'Text was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    def set_thing
      @thing = Thing.find(params[:thing_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:text)
    end
end
