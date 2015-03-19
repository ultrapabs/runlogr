class Comment < ActiveRecord::Base

  validates :author_id, :body, presence: true
  validates :body, length: { maximum: 200 }

  belongs_to :commentable, polymorphic: true

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  def author_name
    self.author.username
  end

end
