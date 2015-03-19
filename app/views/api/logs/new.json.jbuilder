if !@shoes.nil?
  json.shoes @shoes do |shoe|
    json.name shoe.name
    json.shoe_id shoe.id
  end
end
