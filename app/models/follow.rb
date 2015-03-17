class Follow < ActiveRecord::Base

  validates :leader_id, :follower_id, presence: true

  validates :follower_id, uniqueness: { scope: :leader_id }

  belongs_to(
    :follower,
    class_name: "User",
    foreign_key: :follower_id,
    primary_key: :id
  )

  belongs_to(
    :leader,
    class_name: "User",
    foreign_key: :leader_id,
    primary_key: :id
  )

  has_many :leader_blogs, through: :leader, source: :blogs
  has_many :leader_logs, through: :leader, source: :logs
end
