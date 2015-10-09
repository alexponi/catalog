class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
    @thing = Thing.find(params[:thing_id])
  end

  # GET /links/1/edit
  def edit
    @thing = Thing.find(params[:thing_id])
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        @thing = Thing.find(params[:thing_id])
        ThingLink.create(thing_id: params[:thing_id], link_id: @link.id)
        format.html { redirect_to @thing, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    @thing = Thing.find(params[:thing_id])
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @thing, notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @thing = Thing.find(params[:thing_id])
    @link.destroy
    respond_to do |format|
      format.html { redirect_to @thing, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name)
    end
end
