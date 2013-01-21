class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugs

  attr_accessible :title, :content, :published, :image

  slug_on :title

  field :title
  field :content
  field :published, type: Boolean, default: false
  field :tag_list, type: Array

  mount_uploader :image, FileUploader

  belongs_to :user

  default_scope desc(:created_at)

  validates :title, presence: true
  validates :content, presence: true

  def image_src
    image.try(:url)
  end

end
