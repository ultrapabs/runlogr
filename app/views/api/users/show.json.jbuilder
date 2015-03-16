json.is_current_user current_user.id == @user.id

if current_user.id == @user.id
  json.email @user.email
end

json.id @user.id
json.username @user.username
json.description @user.description
json.photo_url @user.photo_url
json.join_month @user.created_at.month
json.join_year @user.created_at.year
json.total_distance @user.total_distance

json.blogs @blogs.each do |blog|

    json.title blog.title
    json.preview blog.preview
    json.body blog.body
    json.author_name blog.author_name
    json.created_at blog.created_at
    json.id blog.id
end

json.logs @logs.each do |log|

    json.title log.title
    json.date log.date
    json.username log.username
    json.distance log.distance
    json.duration log.duration_string
    json.notes log.notes
    json.shoe_id log.shoe_id
    json.pace log.pace
    json.id log.id
end

json.shoes @shoes.each do |shoe|
    json.name shoe.name
    json.total_distance shoe.total_distance
end
