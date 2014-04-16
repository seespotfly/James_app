json.array!(@settings) do |setting|
  json.extract! setting, :id, :code_scheme
  json.url setting_url(setting, format: :json)
end
