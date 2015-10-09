class FileNamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_file_name, only: [:edit, :update, :destroy]
  before_action :set_thing, only: [:new, :create, :edit, :update, :destroy]

  # GET /file_names/new
  def new
    @file_name = FileName.new
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
        format.html { redirect_to @thing, notice: 'File name was successfully updated.' }
        format.json { render :show, status: :ok, location: @thing }
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
      format.html { redirect_to @thing, notice: 'File name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_file_name
      @file_name = FileName.find(params[:id])
    end

    def set_thing
      @thing = Thing.find(params[:thing_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def file_name_params
      params.require(:file_name).permit(:name, :storage)
    end
end
