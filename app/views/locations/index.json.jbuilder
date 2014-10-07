json.array!(@locations) do |location|
  json.extract! location, :street_address, :zipcode, :city, :restaurant_id
  json.url location_url(location, format: :json)
end