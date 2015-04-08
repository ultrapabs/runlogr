json.current_user_is_author current_user.id == @blog.author_id

json.id @blog.id
json.title @blog.title
json.body @blog.body
json.markdown markdown(@blog.body)
json.preview @blog.preview
json.author_name @blog.author_name
json.author_id @blog.author_id
json.author_pic @blog.author_pic
json.created_at @blog.created_at

unless @comments.nil?
  json.comments @comments do |comment|
    json.id comment.id
    json.author_id comment.author_id
    json.author comment.author_name
    json.body comment.body
    json.created_at comment.created_at
  end
end
