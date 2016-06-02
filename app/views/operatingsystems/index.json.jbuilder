json.array!(@operatingsystems) do |operatingsystem|
  json.extract! operatingsystem, :id, :name
  json.url operatingsystem_url(operatingsystem, format: :json)
end
