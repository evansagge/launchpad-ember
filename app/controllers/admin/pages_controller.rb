class Admin::PagesController < Admin::BaseController

  respond_to :html, :json, :xml

  def index
    @pages = Page.page(params[:page]).per(10)
    respond_with :admin, @pages
  end

  def new
    @page = Page.new
    respond_with :admin, @page
  end

  def create
    @page = Page.create(params[:page])
    flash[:notice] = "Your page has been posted." unless @page.errors.any?
    respond_with :admin, @page
  end

  def show
    @page = Page.find_by_slug(params[:id])
    respond_with :admin, @page
  end

  def edit
    @page = Page.find_by_slug(params[:id])
    respond_with :admin, @page
  end

  def update
    @page = Page.find_by_slug(params[:id])
    @page.update_attributes(params[:page])
    flash[:notice] = "Your page has been updated." unless @page.errors.any?
    respond_with :admin, @page
  end

  def destroy
    @page = Page.find_by_slug(params[:id])
    @page.destroy
    flash[:notice] = "Your page has been deleted."
    respond_with :admin, @page
  end
end
