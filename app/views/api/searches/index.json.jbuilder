json.results @search_results.map(&:searchable) do |user|
  json.username user.username
  json.description user.description
  json.id user.id
end
