json.array!(@meals) do |meal|
  json.extract! meal, :meal_name, :meal_price, :cuisine_type, :restaurant_id
  json.url meal_url(meal, format: :json)
end