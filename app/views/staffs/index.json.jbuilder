json.array!(@staffs) do |staff|
  json.extract! staff, :name, :email, :password_digest
  json.url staff_url(staff, format: :json)
end
