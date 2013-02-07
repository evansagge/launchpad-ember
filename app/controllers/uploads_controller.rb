class UploadsController < ApplicationController

  caches_action :show

  def show
    @upload = Upload.find_by_slug(params[:id])
    send_file @upload.filepath(params[:version]), type: @upload.content_type,
      url_based_filename: true, disposition: 'inline'
  end

end