class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :network]
  # before_action :check_complete, only: [:show, :network]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    @user.nonild.nil? ? nonild = 0 : nonild = @user.nonild
    @user.ipfpatients.nil? ? ipfpatients = 0 : ipfpatients = @user.ipfpatients
    @user.sarcoidpatients.nil? ? sarcoidpatients = 0 : sarcoidpatients = @user.nonild
    @user.iippatients.nil? ? iippatients = 0 : iippatients = @user.iippatients
    @user.ctdpatients.nil? ? ctdpatients = 0 : ctdpatients = @user.ctdpatients
    @user.unclasspatients.nil? ? unclasspatients = 0 : unclasspatients = @user.unclasspatients
    @user.hppatients.nil? ? hppatients = 0 : hppatients = @user.hppatients
    @user.other.nil? ? other = 0 : other = @user.other

    @cases = [['Non-ILD', nonild],
              ['IPF', ipfpatients],
              ['Sarcoidosis', sarcoidpatients],
              ['Non-IPF IIP', iippatients],
              ['CTDs', ctdpatients],
              ['Unclassifiable', unclasspatients],
              ['Hypersensitivity pneumonitis', hppatients],
              ['Other', other]]

    @cases = @cases.reject {|a| a[1] == 0 }
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash[:error] =  @user.errors.full_messages.to_sentence
        format.html { redirect_to edit_user_path(@user)}
        format.js { render :nothing => true}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        CompletedWorker.perform_async(@user.member.email)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        flash[:error] =  @user.errors.full_messages
        format.html { render :edit }
        format.json { }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def network
    @user_count = User.all.count
    @user_json = User.all.group_by(&:iso).map{|k,v| [k, v.count, k.to_s.downcase]}.map {|c, v | ["code" => c, "value" => v, "flag" => c.to_s.downcase]}.flatten.to_json
    render 'network'
  end

  def popular_topics
    @members = User.all.count
    @total_views = current_user.impressionist_count.to_i + current_user.total_question_impressions.to_i + current_user.total_publication_impressions.to_i
    @topics = ActsAsTaggableOn::Tag.most_used(5).to_a.flatten.map(&:serializable_hash).to_json
    render 'users/charts/popular_topics'
  end


  def freq
    unless params[:user][:country].empty?
      @frequency_test = User.where(iso: params[:user][:country]).group('schedule')
      @frequency = User.where(iso: params[:user][:country]).group('schedule').count.map { |k,v| [ "name" => k, "y" => v]}.flatten.to_json
    else
      @members = User.all.count
      @frequency = User.all.group('schedule').count.map { |k,v| [ "name" => k, "y" => v]}.flatten.to_json
    end
  end

  def ipf
  end

  def mdt
    unless params[:user][:country].empty?
      @frequency_test = User.where(iso: params[:user][:country]).group('ipf')
      @frequency = User.where(iso: params[:user][:country]).group('ipf').count.map { |k,v| [ "name" => k, "y" => v]}.flatten.to_json
    else
      @members = User.all.count
      @frequency = User.all.group('ipf').count.map { |k,v| [ "name" => k, "y" => v]}.flatten.to_json
    end
  end

  def ild
    unless params[:user][:country].empty?
      @frequency_test = User.where(iso: params[:user][:country]).group('cases')
      @frequency = User.where(iso: params[:user][:country]).group('cases').count.map { |k,v| [ "name" => k, "y" => v]}.flatten.to_json
    else
      @members = User.all.count
      @frequency = User.all.group('cases').count.map { |k,v| [ "name" => k, "y" => v]}.flatten.to_json
    end
  end

  private

    def check_complete
      unless current_user.attributes.select { |a, v| v == nil }.reject { |a, v|  a == "radiologist" || a == "pathologist"}.empty?
        flash[:error] =  "Please complete the form details before proceeding"
        redirect_to edit_user_path(current_user)
      end
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:experience,
                                   :kind,
                                   :practice,
                                   :biopsy,
                                   :cryobiopsy,
                                   :nonild,
                                   :specialist,
                                   :ipfpatients,
                                   :hppatients,
                                   :sarcoidpatients,
                                   :iippatients,
                                   :ctdpatients,
                                   :unclasspatients,
                                   :other,
                                   :country,
                                   :institute,
                                   :ipf,
                                   :institute_type,
                                   :schedule,
                                   :cases,
                                   rads_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   paths_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   rheumatologists_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   others_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   physicians_attributes: [:user_id, :experience, :kind, :id, :_destroy])
    end
end
