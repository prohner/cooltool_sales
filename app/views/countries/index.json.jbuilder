json.array!(@countries) do |country|
  json.extract! country, :country, :digraph
  json.url country_url(country, format: :json)
end