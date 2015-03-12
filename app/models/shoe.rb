class Shoe < ActiveRecord::Base

  validates :user_id, :name, :distance, presence: true
  validates :name, length: { maximum: 30 }

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :logs,
    class_name: "Log",
    foreign_key: :shoe_id,
    primary_key: :id
  )


end
