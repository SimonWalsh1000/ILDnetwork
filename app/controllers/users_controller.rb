class UsersController < ApplicationController

  include UsersHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]


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
    @participants_notifier = true if @user.rads.blank? && @user.physicians.blank? && @user.paths.blank? && @user.rheumatologists.blank? && @user.others.blank?
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
    completion = @user.user_complete
    respond_to do |format|
      if @user.update(user_params)
        # CompletedWorker.perform_async(@user.member.email) unless completion == true
        CompletionMailer.notify_admin_completion(@user.member.email).deliver_now
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
    @user_country_array = Array.new
    @user_country_array = User.all.map {|user| user.country }.reject{ |country| country.nil? }.uniq.sort
    @user_count = User.all.select { |u| u.user_complete == true }.count
    @user_json = User.all.group_by(&:iso).map{|k,v| [k, v.count, k.to_s.downcase]}.map {|c, v | ["code" => c, "value" => v, "flag" => c.to_s.downcase]}.flatten.to_json
    @sectiona =  User.all.group('practice').count.map { |k,v| [ "name" => k, "y" => v] unless k.nil?}.reject { |a| a.blank? }.flatten.to_json
    render 'network'
  end

  def nation
    @iso = get_iso params[:user][:nation]
    @nation = params[:user][:nation]
    @user_country_array = Array.new
    @user_count_country = User.select { |u| u.user_complete == true && u.country == @nation }.count
    @nation_practices =  User.where(country: @nation).group('practice').count.map { |k,v| [ "name" => k, "y" => v] unless k.nil?}.reject { |a| a.blank? }.flatten.to_json
    @nation_institutions =  User.where(country: @nation).group('institute_type').count.map { |k,v| [ "name" => k, "y" => v] unless k.nil?}.reject { |a| a.blank? }.flatten.to_json
    @nation_biopsy =
            User.where(country: @nation)
            .group(:institute_type)
            .select(:institute_type, "AVG(biopsy) AS biopsy_count")
            .flat_map { |group| ["name" => group.institute_type, "y" => group.biopsy_count.ceil]}.to_json

    @arr_phys = Array.new
    Physician.all.reject {|p| p.user.nil?}.map { |p| p.user if p.user.country == @nation && p.user }.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.select { |u, v| @arr_phys << v}
    @arr_rads = Array.new
    Rad.all.reject {|p| p.user.nil?}.map { |u| u.user if u.user.country == @nation }.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.select { |u, v| @arr_rads << v}
    @arr_paths = Array.new
    Path.all.reject {|p| p.user.nil?}.map { |u| u.user if u.user.country == @nation }.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.select { |u, v| @arr_paths << v}
    @arr_rheum = Array.new
    Rheumatologist.all.reject {|p| p.user.nil?}.select { |u| u.user.country == @nation}.inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }.select { |u, v| @arr_rheum << v}
    render 'country'
  end

  def admin
    @visits = Visit.all.order(:created_at => :desc).paginate(page: params[:page], :per_page => 50)
    if current_user.admin?
      render 'users/admin/raw'
    else
      sign_out_and_redirect(current_member)
    end
  end

  def census
    if current_user.admin?
      @users = User.all
      @user_count = User.all.select { |u| u.user_complete == true }.count
      render 'users/admin/census'
    else
      sign_out_and_redirect(current_member)
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
                                   :skip,
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
                                   :document,
                                   :nation,
                                   :imaging,
                                   :histopathology,
                                   :teleconference,
                                   :teleimaging,
                                   :telepath,
                                   rads_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   paths_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   rheumatologists_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   others_attributes: [:user_id, :experience, :kind, :id, :_destroy],
                                   physicians_attributes: [:user_id, :experience, :kind, :id, :_destroy])
    end

end
