json.array!(@boxdetails) do |boxdetail|
  json.extract! boxdetail, :id, :department_id, :name, :manufacturer, :model, :ipaddress, :serialnum, :partnum, :customtag, :servicetag, :location_id, :operatingsystem_id, :osversion, :bonding, :warrantystart, :warrantyend, :empid, :servicestate_id, :description, :notes
  json.url boxdetail_url(boxdetail, format: :json)
end
