json.array!(@parking_codes) do |parking_code|
  json.extract! parking_code, :code, :codedate
  json.url parking_code_url(parking_code, format: :json)
end
