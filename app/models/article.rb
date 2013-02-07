class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugs
  include Launchpad::Models::MarkdownContent

  attr_accessible :title, :content, :published, :image

  slug_on :title

  field :title
  field :published, type: Boolean, default: false
  field :tag_list, type: Array

  mount_uploader :image, FileUploader

  belongs_to :user

  default_scope desc(:created_at)

  validates :title, presence: true

  before_save :render_html_content

  def image_src
    image.try(:url)
  end

  def body
    html_content.gsub(/\s*<p>!\[more\]\<\/p>/, '')
  end

  def summary
    html_content.split(/\s*<p>!\[more\]<\/p>/).first
  end

  def summarized?
    !!(html_content =~ /\s*<p>!\[more\]<\/p>/)
  end
  alias :summarized :summarized?
  
end
