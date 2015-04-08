class Blog < ActiveRecord::Base

  validates :author_id, :title, :body, presence: true
  validates :preview, length: { maximum: 100 }
  validates :title, length: { maximum: 30 }

  has_many :comments, as: :commentable

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

  def author_name
    self.author.username
  end

  def author_pic
    self.author.profile_pic(:feed)
  end

end
