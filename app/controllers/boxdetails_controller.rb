class BoxdetailsController < ApplicationController
  before_action :set_boxdetail, only: [:show, :edit, :update, :destroy]

  def global_vals
    @departments = Department.all.order(name: :asc)
    @locations = Location.all.order(city: :asc)
    @operatingsystems = Operatingsystem.all.order(id: :asc)
    @servicestates = Servicestate.all.order(name: :asc)
  end

  # GET /boxdetails
  # GET /boxdetails.json
  def index
    @boxdetails = Boxdetail.all
  end

  # GET /boxdetails/1
  # GET /boxdetails/1.json
  def show
  end

  def recent
	@boxdetails = Boxdetail.last(3)
  end

  def boxsearch
	@boxdetails = Boxdetail.where("name LIKE ?", "%#{params[:find]}%")
  end

  def visuals
    @boxdetails = Boxdetail.all
  end

  def visualsHighchart
    @boxdetails = Boxdetail.all
    @deptboxcount = Boxdetail.group(:department_id).count
  end

  # GET /boxdetails/new
  def new
    @boxdetail = Boxdetail.new
    global_vals
  end

  # GET /boxdetails/1/edit
  def edit
    global_vals
  end

  # POST /boxdetails
  # POST /boxdetails.json
  def create
    @boxdetail = Boxdetail.new(boxdetail_params)

    respond_to do |format|
      if @boxdetail.save!
        format.html { redirect_to @boxdetail, notice: 'Boxdetail was successfully created.' }
        format.json { render :show, status: :created, location: @boxdetail }
      else
        format.html { render :new }
        format.json { render json: @boxdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boxdetails/1
  # PATCH/PUT /boxdetails/1.json
  def update
    respond_to do |format|
      if @boxdetail.update(boxdetail_params)
        format.html { redirect_to @boxdetail, notice: 'Boxdetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @boxdetail }
      else
        format.html { render :edit }
        format.json { render json: @boxdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boxdetails/1
  # DELETE /boxdetails/1.json
  def destroy
    @boxdetail.destroy
    respond_to do |format|
      format.html { redirect_to boxdetails_url, notice: 'Boxdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boxdetail
      @boxdetail = Boxdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boxdetail_params
      params.require(:boxdetail).permit(:department_id, :name, :manufacturer, :model, :ipaddress, :serialnum, :partnum, :customtag, :servicetag, :location_id, :operatingsystem_id, :osversion, :bonding, :warrantystart, :warrantyend, :empid, :servicestate_id, :description, :notes)
    end
end
