json.activities do 
  json.array! @activities, :id, :name, :description
end