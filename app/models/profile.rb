class Profile
  include Mongoid::Document

  field :first_name
  field :last_name
  field :display_name

  embedded_in :user
end