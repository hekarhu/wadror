json.array!(@ratings) do |brewery|
  json.extract! rating, :score :beer_id
  json.url rating_url(rating, format: :json)
end
