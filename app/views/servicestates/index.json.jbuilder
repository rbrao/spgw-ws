json.array!(@servicestates) do |servicestate|
  json.extract! servicestate, :id, :name
  json.url servicestate_url(servicestate, format: :json)
end
