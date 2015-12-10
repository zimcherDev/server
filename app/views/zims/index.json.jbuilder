json.array!(@zims) do |zim|
  json.extract! zim, :id, :name, :description, :image_url, :publicity
  json.url zim_url(zim, format: :json)
end
