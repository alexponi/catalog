class FileNamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file_name, only: [:show, :edit, :update, :destroy]

  # GET /file_names
  # GET /file_names.json
  def index
    @file_names = FileName.all
  end

  # GET /file_names/1
  # GET /file_names/1.json
  def show
  end

  # GET /file_names/new
  def new
    @file_name = FileName.new
    @thing = Thing.find(params[:thing_id])
  end

  # GET /file_names/1/edit
  def edit
  end

  # POST /file_names
  # POST /file_names.json
  def create
    @file_name = FileName.new(file_name_params)

    respond_to do |format|
      if @file_name.save
        @thing = Thing.find(params[:thing_id])
        ThingFile.create(thing_id: params[:thing_id], file_name_id: @file_name.id)
        format.html { redirect_to @thing, notice: 'File name was successfully created.' }
        format.json { render :show, status: :created, location: @thing }
      else
        format.html { render :new }
        format.json { render json: @file_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /file_names/1
  # PATCH/PUT /file_names/1.json
  def update
    respond_to do |format|
      if @file_name.update(file_name_params)
        format.html { redirect_to @file_name, notice: 'File name was successfully updated.' }
        format.json { render :show, status: :ok, location: @file_name }
      else
        format.html { render :edit }
        format.json { render json: @file_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_names/1
  # DELETE /file_names/1.json
  def destroy
    @file_name.destroy
    respond_to do |format|
      format.html { redirect_to file_names_url, notice: 'File name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_name
      @file_name = FileName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_name_params
      params.require(:file_name).permit(:name, :storage)
    end
end
