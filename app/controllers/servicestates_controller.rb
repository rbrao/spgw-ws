class ServicestatesController < ApplicationController
  before_action :set_servicestate, only: [:show, :edit, :update, :destroy]

  # GET /servicestates
  # GET /servicestates.json
  def index
    @servicestates = Servicestate.all
  end

  # GET /servicestates/1
  # GET /servicestates/1.json
  def show
  end

  # GET /servicestates/new
  def new
    @servicestate = Servicestate.new
  end

  # GET /servicestates/1/edit
  def edit
  end

  # POST /servicestates
  # POST /servicestates.json
  def create
    @servicestate = Servicestate.new(servicestate_params)

    respond_to do |format|
      if @servicestate.save
        format.html { redirect_to @servicestate, notice: 'Servicestate was successfully created.' }
        format.json { render :show, status: :created, location: @servicestate }
      else
        format.html { render :new }
        format.json { render json: @servicestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /servicestates/1
  # PATCH/PUT /servicestates/1.json
  def update
    respond_to do |format|
      if @servicestate.update(servicestate_params)
        format.html { redirect_to @servicestate, notice: 'Servicestate was successfully updated.' }
        format.json { render :show, status: :ok, location: @servicestate }
      else
        format.html { render :edit }
        format.json { render json: @servicestate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servicestates/1
  # DELETE /servicestates/1.json
  def destroy
    @servicestate.destroy
    respond_to do |format|
      format.html { redirect_to servicestates_url, notice: 'Servicestate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicestate
      @servicestate = Servicestate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def servicestate_params
      params.require(:servicestate).permit(:name)
    end
end
