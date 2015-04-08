if @search_results.empty?
  json.no_results true
else
  json.array! @search_results.each do |user|

    json.username user.username
    json.description user.description
    json.id user.id
    json.pic user.profile_pic(:feed)
  end
end
