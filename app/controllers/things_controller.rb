class ThingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_thing, only: [:show, :edit, :update, :destroy]

  def index
    @current_user = current_user if current_user
    if params[:name] || params[:feature] || params[:abbreviation]
      things = Thing.where(user_id: @current_user.id)
       @things = things.search(params[:name], params[:feature], params[:abbreviation])
    else
      @things = Thing.where(user_id: @current_user.id)
    end
  end

  def show
  end

  def new
    @thing = Thing.new
  end

  def edit
  end

  def create
    @thing = Thing.new(thing_params)

    respond_to do |format|
      if @thing.save
        format.html { redirect_to @thing, notice: 'Thing was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @thing.update(thing_params)
        format.html { redirect_to @thing, notice: 'Thing was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
      else
        format.html { render :edit }
        format.json { render json: @thing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @thing.destroy
    respond_to do |format|
      format.html { redirect_to things_url, notice: 'Thing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thing
      @thing = Thing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thing_params
      params.require(:thing).permit(:name, :feature, :abbreviation, :description).merge(user_id: current_user.id)
    end
end
