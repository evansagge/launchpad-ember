object :@article

attribute :slug => :id
attributes :title, :content

child :user do
  attributes :email, :first_name, :last_name, :display_name
end