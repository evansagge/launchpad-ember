class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugs

  field :title
  field :content
  field :published, type: Boolean, default: false
  field :display_title, type: Boolean

  belongs_to :user

  slug_on :title

  default_scope desc(:created_at)

  validates :title, presence: true
  validates :content, presence: true

end
