class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :set_thing, only: [:new, :create, :edit, :update, :destroy]

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)

    respond_to do |format|
      if @tag.save
        ThingTag.create(thing_id: params[:thing_id], tag_id: @tag.id)
        format.html { redirect_to @thing, notice: 'Tag was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @thing, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to @thing, notice: 'Tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def set_thing
      @thing = Thing.find(params[:thing_id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end

end
