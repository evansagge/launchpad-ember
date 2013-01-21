attributes :id, :email

child :profile do
  attributes :first_name, :last_name, :display_name
end