json.array!(@kids) do |kid|
  json.extract! kid, :id, :name, :age, :purpose, :money_required, :comments, :image_url, :address, :money_received
  json.url kid_url(kid, format: :json)
end
