json.array!(@friends) do |friend|
  json.extract! friend, :id, :name, :spouse, :email, :group_id
  json.url friend_url(friend, format: :json)
end
