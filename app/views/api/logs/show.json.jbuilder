json.current_user_is_user current_user.id == @log.user_id

unless @shoes.nil?
  json.shoe_options @shoes do |shoe|
    json.name shoe.name
    json.shoe_id shoe.id
  end
end

unless @comments.nil?
  json.comments @comments do |comment|
    json.id comment.id
    json.author_id comment.author_id
    json.author comment.author_name
    json.body comment.body
    json.created_at comment.created_at
  end
end

json.title @log.title
json.date @log.date
json.username @log.username
json.distance @log.distance
json.duration_string @log.duration_string
json.hours @log.log_hours
json.minutes @log.log_minutes
json.seconds @log.log_seconds
json.notes @log.notes
json.user_id @log.user_id
json.shoe_name @log.shoe_name
json.shoe_id @log.shoe_id

json.pace @log.pace
json.id @log.id
