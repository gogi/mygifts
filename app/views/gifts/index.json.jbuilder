json.array!(@gifts) do |gift|
  json.extract! gift, :id, :name, :price, :description, :user_id
  json.url gift_url(gift, format: :json)
end
