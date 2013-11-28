class AppVersionsController < ApplicationController
  before_action :set_app_version, only: [:show, :edit, :update, :destroy]

  # GET /app_versions
  # GET /app_versions.json
  def index
    @app_versions = AppVersion.all
  end

  # GET /app_versions/1
  # GET /app_versions/1.json
  def show
  end

  # GET /app_versions/new
  def new
    @app_version = AppVersion.new
  end

  # GET /app_versions/1/edit
  def edit
  end

  # POST /app_versions
  # POST /app_versions.json
  def create
    @app_version = AppVersion.new(app_version_params)

    respond_to do |format|
      if @app_version.save
        format.html { redirect_to @app_version, notice: 'App version was successfully created.' }
        format.json { render action: 'show', status: :created, location: @app_version }
      else
        format.html { render action: 'new' }
        format.json { render json: @app_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /app_versions/1
  # PATCH/PUT /app_versions/1.json
  def update
    respond_to do |format|
      if @app_version.update(app_version_params)
        format.html { redirect_to @app_version, notice: 'App version was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @app_version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_versions/1
  # DELETE /app_versions/1.json
  def destroy
    @app_version.destroy
    respond_to do |format|
      format.html { redirect_to app_versions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_app_version
      @app_version = AppVersion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def app_version_params
      params.require(:app_version).permit(:version)
    end
end
