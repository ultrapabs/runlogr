class Log < ActiveRecord::Base

  validates :user_id, :date, :distance, :duration, presence: true
  validates :notes, length: { maximum: 200 }
  validates :title, length: { maximum: 30 }

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_one(
    :shoe,
    class_name: "Shoe",
    foreign_key: :shoe_id,
    primary_key: :id
  )

end
