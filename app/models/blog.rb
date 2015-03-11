class Blog < ActiveRecord::Base

  validates :author_id, :title, :body, presence: true
  validates :preview, length: { maximum: 100 }
  validates :title, length: { maximum: 30 }

  belongs_to(
    :author,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id
  )

end
