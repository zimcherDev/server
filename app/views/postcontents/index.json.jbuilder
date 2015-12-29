json.array!(@postcontents) do |postcontent|
  json.extract! postcontent, :id, :description, :media_url, :media_type, :post_id
  json.url postcontent_url(postcontent, format: :json)
end
