class RheumatologistsController < ApplicationController
  before_action :set_rheumatologist, only: [:show, :edit, :update, :destroy]

  # GET /rheumatologists
  # GET /rheumatologists.json
  def index
    @rheumatologists = Rheumatologist.all
  end

  # GET /rheumatologists/1
  # GET /rheumatologists/1.json
  def show
  end

  # GET /rheumatologists/new
  def new
    @rheumatologist = Rheumatologist.new
  end

  # GET /rheumatologists/1/edit
  def edit
  end

  # POST /rheumatologists
  # POST /rheumatologists.json
  def create
    @rheumatologist = Rheumatologist.new(rheumatologist_params)

    respond_to do |format|
      if @rheumatologist.save
        format.html { redirect_to @rheumatologist, notice: 'Rheumatologist was successfully created.' }
        format.json { render :show, status: :created, location: @rheumatologist }
      else
        format.html { render :new }
        format.json { render json: @rheumatologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rheumatologists/1
  # PATCH/PUT /rheumatologists/1.json
  def update
    respond_to do |format|
      if @rheumatologist.update(rheumatologist_params)
        format.html { redirect_to @rheumatologist, notice: 'Rheumatologist was successfully updated.' }
        format.json { render :show, status: :ok, location: @rheumatologist }
      else
        format.html { render :edit }
        format.json { render json: @rheumatologist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rheumatologists/1
  # DELETE /rheumatologists/1.json
  def destroy
    @rheumatologist.destroy
    respond_to do |format|
      format.html { redirect_to rheumatologists_url, notice: 'Rheumatologist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rheumatologist
      @rheumatologist = Rheumatologist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rheumatologist_params
      params[:rheumatologist]
    end
end
