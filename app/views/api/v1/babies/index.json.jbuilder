json.babies do
  json.array! @babies, :id, :name, :months, :mother_name, :father_name, :address, :phone
end