json.array!(@donations) do |donation|
  json.extract! donation, :id, :kid_id, :user_id, :donation_time, :amount
  json.url donation_url(donation, format: :json)
end
