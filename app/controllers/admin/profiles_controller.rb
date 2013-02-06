class Admin::ProfilesController < Admin::BaseController

  respond_to :html, :json, :xml

  def show
    @profile = current_user.profile
    respond_with :admin, @profile do |format|
      format.html { render :edit }
    end
  end

  def edit
    @profile = current_user.profile
    respond_with :admin, @profile
  end

  def update
    @profile = current_user.profile
    @profile.update_attributes(params[:profile])
    flash.now[:notice] = "Your profile has been updated."
    respond_with :admin, @profile do |format|
      format.html { render :edit }
    end
  end

end