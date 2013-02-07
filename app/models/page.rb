class Page
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slugs
  include Launchpad::Models::MarkdownContent

  field :title
  field :published, type: Boolean, default: false
  field :display_title, type: Boolean

  belongs_to :user

  slug_on :title

  default_scope desc(:created_at)

  validates :title, presence: true

end