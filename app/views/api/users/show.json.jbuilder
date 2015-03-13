json.id @user.id
json.username @user.username
json.description @user.description
json.photo_url @user.photo_url
json.join_month @user.created_at.month
json.join_year @user.created_at.year

json.blogs do
  json.array! @blogs.each do |blog|

    json.title blog.title
    json.preview blog.preview
    json.body blog.body
    json.created_at blog.created_at

  end
end

json.logs do
  json.array! @logs.each do |log|

    json.title log.title
    json.date log.date
    json.distance log.distance
    json.duration log.duration
    json.notes log.notes
    json.shoe_id log.shoe_id

  end
end

json.shoes do
  json.array! @shoes.each do |shoe|

    json.name shoe.name
    json.distance shoe.distance

  end
end
