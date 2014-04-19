json.array!(@relationships) do |relationship|
  json.extract! relationship, :id, :name, :text_count
  json.url relationship_url(relationship, format: :json)
end
