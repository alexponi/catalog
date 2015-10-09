class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_link, only: [:edit, :update, :destroy]
  before_action :set_thing, only: [:new, :create, :edit, :update, :destroy]

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
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
    
    def set_thing
      @thing = Thing.find(params[:thing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name)
    end
end
