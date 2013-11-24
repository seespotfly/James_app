json.array!(@text_data) do |text_datum|
  json.extract! text_datum, 
  json.url text_datum_url(text_datum, format: :json)
end
