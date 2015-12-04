class RadsController < ApplicationController
  before_action :set_rad, only: [:show, :edit, :update, :destroy]

  # GET /rads
  # GET /rads.json
  def index
    @rads = Rad.all
  end

  # GET /rads/1
  # GET /rads/1.json
  def show
  end

  # GET /rads/new
  def new
    @rad = Rad.new
  end

  # GET /rads/1/edit
  def edit
  end

  # POST /rads
  # POST /rads.json
  def create
    @rad = Rad.new(rad_params)

    respond_to do |format|
      if @rad.save
        format.html { redirect_to @rad, notice: 'Rad was successfully created.' }
        format.json { render :show, status: :created, location: @rad }
      else
        format.html { render :new }
        format.json { render json: @rad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rads/1
  # PATCH/PUT /rads/1.json
  def update
    respond_to do |format|
      if @rad.update(rad_params)
        format.html { redirect_to @rad, notice: 'Rad was successfully updated.' }
        format.json { render :show, status: :ok, location: @rad }
      else
        format.html { render :edit }
        format.json { render json: @rad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rads/1
  # DELETE /rads/1.json
  def destroy
    @rad.destroy
    respond_to do |format|
      format.html { redirect_to rads_url, notice: 'Rad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rad
      @rad = Rad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rad_params
      params.require(:rad).permit(:user_id, :experience, :type)
    end
end
