json.array! @shoes do |shoe|

  json.id = shoe.id
  json.user_id = shoe.user_id
  json.username = shoe.user.username
  json.name = shoe.name
  json.distance = shoe.total_distance

end
