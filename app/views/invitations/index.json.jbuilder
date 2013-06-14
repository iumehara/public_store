json.array!(@invitations) do |invitation|
  json.extract! invitation, :staff_id, :store_id, :credential
  json.url invitation_url(invitation, format: :json)
end
