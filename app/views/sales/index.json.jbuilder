json.array!(@sales) do |sale|
  json.extract! sale, :units, :proceeds, :customer_currency, :country_id, :currency_of_proceeds, :customer_price
  json.url sale_url(sale, format: :json)
end