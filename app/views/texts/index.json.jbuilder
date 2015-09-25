json.array!(@texts) do |text|
  json.extract! text, :id, :text
  json.url text_url(text, format: :json)
end
