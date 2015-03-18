json.array! @search_results.each do |user|
  json.username user.username
  json.description user.description
  json.id user.id
end
