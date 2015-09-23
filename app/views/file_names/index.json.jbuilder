json.array!(@file_names) do |file_name|
  json.extract! file_name, :id, :name, :storage
  json.url file_name_url(file_name, format: :json)
end
