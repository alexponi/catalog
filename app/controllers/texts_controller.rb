class TextsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
  end

  # GET /texts/new
  def new
    @text = Text.new
    @thing = Thing.find(params[:thing_id])
  end

  # GET /texts/1/edit
  def edit
    @thing = Thing.find(params[:thing_id])
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(text_params)

    respond_to do |format|
      if @text.save
        @thing = Thing.find(params[:thing_id])
        ThingText.create(thing_id: params[:thing_id], text_id: @text.id)
        format.html { redirect_to @thing, notice: 'Text was successfully created.' }
        format.json { render :show, status: :created, location: @text }
      else
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    @thing = Thing.find(params[:thing_id])
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

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @thing = Thing.find(params[:thing_id])
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:text)
    end
end
