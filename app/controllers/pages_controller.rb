class PagesController < ApplicationController

  respond_to :json

  def show
    @page = Page.find_by_slug(params[:id])
    respond_with @page
  end

end