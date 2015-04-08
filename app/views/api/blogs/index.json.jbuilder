json.array! @blogs do |blog|

  json.id blog.id
  json.title blog.title
  json.preview blog.preview
  json.author_name blog.author_name
  json.author_id blog.author_id
  json.author_pic blog.author_pic
  json.created_at blog.created_at

end
