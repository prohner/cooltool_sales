json.array!(@apps) do |app|
  json.extract! app, :title, :sku, :apple_identifier, :category
  json.url app_url(app, format: :json)
end