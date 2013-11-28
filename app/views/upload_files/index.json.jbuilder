json.array!(@upload_files) do |upload_file|
  json.extract! upload_file, :filename
  json.url upload_file_url(upload_file, format: :json)
end