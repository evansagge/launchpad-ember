class Admin::UploadsController < Admin::BaseController

  respond_to :html, :json, :xml

  def index
    @uploads = Upload.page(params[:page]).per(12)
    respond_with :admin, @uploads do |format|
      format.json { render json: @uploads.map(&:to_jquery_fileupload) }
    end
  end

  def new
    @upload = Upload.new
    respond_with :admin, @upload
  end

  def create
    @upload = Upload.create(params[:upload])
    if @upload.errors.any?
      flash[:notice] = render_errors(@upload)
    else
      flash[:notice] = "Your file has been uploaded."
    end
    respond_with :admin, @upload do |format|
      format.html { redirect_to action: :index }
      format.json { render json: [@upload.to_jquery_fileupload] }
    end
  end

  def show
    @upload = Upload.find(params[:id])
    respond_with :admin, @upload do |format|
      format.html do
        if params[:modal]
          render partial: "modal", layout: false
        elsif params[:attachment]
          send_file @upload.filepath(params[:version]), type: @upload.content_type,
            url_based_filename: true, disposition: 'inline'
        end
      end
      format.json { render json: @upload.to_jquery_fileupload }
    end
  end

  def edit
    @upload = Upload.find(params[:id])

    respond_with :admin, @upload do |format|
      format.json { render json: @upload.to_jquery_fileupload }
    end
  end

  def update
    @upload = Upload.find(params[:id])
    @upload.update_attributes(params[:upload])
    flash[:notice] = "Your file has been updated." unless @upload.errors.any?
    respond_with :admin, @upload do |format|
      format.html { redirect_to action: :index }
      format.json { render json: @upload.to_jquery_fileupload }
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy
    flash[:notice] = "Your file has been deleted."
    respond_with :admin, @upload
  end
end