attribute :slug => :id

attributes :title, :body, :summary, :summarized

child :user do
  attributes :email, :first_name, :last_name, :display_name
end