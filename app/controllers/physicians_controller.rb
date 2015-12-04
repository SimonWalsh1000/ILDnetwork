class PhysiciansController < ApplicationController
  before_action :set_physician, only: [:show, :edit, :update, :destroy]

  # GET /physicians
  # GET /physicians.json
  def index
    @physicians = Physician.all
  end

  # GET /physicians/1
  # GET /physicians/1.json
  def show
  end

  # GET /physicians/new
  def new
    @physician = Physician.new
  end

  # GET /physicians/1/edit
  def edit
  end

  # POST /physicians
  # POST /physicians.json
  def create
    @physician = Physician.new(physician_params)

    respond_to do |format|
      if @physician.save
        format.html { redirect_to @physician, notice: 'Physician was successfully created.' }
        format.json { render :show, status: :created, location: @physician }
      else
        format.html { render :new }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /physicians/1
  # PATCH/PUT /physicians/1.json
  def update
    respond_to do |format|
      if @physician.update(physician_params)
        format.html { redirect_to @physician, notice: 'Physician was successfully updated.' }
        format.json { render :show, status: :ok, location: @physician }
      else
        format.html { render :edit }
        format.json { render json: @physician.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /physicians/1
  # DELETE /physicians/1.json
  def destroy
    @physician.destroy
    respond_to do |format|
      format.html { redirect_to physicians_url, notice: 'Physician was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_physician
      @physician = Physician.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def physician_params
      params.require(:physician).permit(:user_id, :experience, :type)
    end
end
