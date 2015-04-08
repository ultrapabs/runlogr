json.array! @logs do |log|

  json.title log.title
  json.date log.date
  json.username log.username
  json.user_id log.user_id
  json.user_pic log.user_pic
  json.distance log.distance
  json.duration_string log.duration_string
  json.pace log.pace
  json.id log.id

end
