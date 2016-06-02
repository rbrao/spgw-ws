class OperatingsystemsController < ApplicationController
  before_action :set_operatingsystem, only: [:show, :edit, :update, :destroy]

  # GET /operatingsystems
  # GET /operatingsystems.json
  def index
    @operatingsystems = Operatingsystem.all.order(name: :asc)
  end

  # GET /operatingsystems/1
  # GET /operatingsystems/1.json
  def show
  end

  # GET /operatingsystems/new
  def new
    @operatingsystem = Operatingsystem.new
  end

  # GET /operatingsystems/1/edit
  def edit
  end

  # POST /operatingsystems
  # POST /operatingsystems.json
  def create
    @operatingsystem = Operatingsystem.new(operatingsystem_params)

    respond_to do |format|
      if @operatingsystem.save
        format.html { redirect_to @operatingsystem, notice: 'Operatingsystem was successfully created.' }
        format.json { render :show, status: :created, location: @operatingsystem }
      else
        format.html { render :new }
        format.json { render json: @operatingsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operatingsystems/1
  # PATCH/PUT /operatingsystems/1.json
  def update
    respond_to do |format|
      if @operatingsystem.update(operatingsystem_params)
        format.html { redirect_to @operatingsystem, notice: 'Operatingsystem was successfully updated.' }
        format.json { render :show, status: :ok, location: @operatingsystem }
      else
        format.html { render :edit }
        format.json { render json: @operatingsystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operatingsystems/1
  # DELETE /operatingsystems/1.json
  def destroy
    @operatingsystem.destroy
    respond_to do |format|
      format.html { redirect_to operatingsystems_url, notice: 'Operatingsystem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operatingsystem
      @operatingsystem = Operatingsystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operatingsystem_params
      params.require(:operatingsystem).permit(:name)
    end
end
