json.extract! user, :id, :name, :email, :pass_salt, :pass_hash, :type, :created_at, :updated_at
json.url user_url(user, format: :json)
