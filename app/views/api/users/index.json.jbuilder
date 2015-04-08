json.array! @users do |user|
  json.id user.id
  json.username user.username
  json.description user.description
  json.pic user.profile_pic(:feed)
  
end
