class Upload
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugs

  attr_accessible :raw_data, :title, :description

  field :raw_data
  field :content_type
  field :file_size
  field :title
  field :description

  mount_uploader :raw_data, FileUploader

  slug_on :title

  default_scope desc(:created_at)

  before_validation :update_file_attributes

  def thumb
    raw_data.thumb if image?
  end

  def normal
    raw_data.normal if image?
  end

  def thumbnail_url(version = :thumb)
    if image?
      url(version)
    else
      if version == :mini
        "http://placehold.it/80x80"
      else
        "http://placehold.it/200x200"
      end
    end
  end

  def image?
    content_type.start_with?("image/")
  end

  def filename
    File.basename(raw_data.url) if raw_data
  end

  def filepath(version = nil)
    if version
      raw_data.versions[version.to_sym].path
    else
      raw_data.path
    end
  end

  def url(version = nil)
    if raw_data.present?
      params = ["/uploads", slug]
      params << version if version
      params.join("/") << File.extname(raw_data.url)
    else
      "/uploads/#{_id}"
    end
  end

  def to_jquery_fileupload
    {
      id: self.id,
      is_image: self.image?,
      name: self.filename,
      size: self.file_size,
      preview_url: ["/admin/uploads/#{id}", image? ? "modal=1" : "attachment=1"].join("?"),
      url: self.url,
      thumbnail_url: self.thumbnail_url(:mini),
    }
  end

  protected

  def update_file_attributes
    if raw_data.present? and raw_data.cached?.present?
      self.title ||= File.basename(raw_data.file.filename, File.extname(raw_data.file.filename))
      self.content_type = raw_data.file.content_type
      self.file_size = raw_data.file.size
    end
  end
end