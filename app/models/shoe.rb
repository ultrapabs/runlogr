class Shoe < ActiveRecord::Base

  validates :user_id, :name, :distance, presence: true
  validates :name, length: { maximum: 20 }

  before_destroy :remove_from_logs

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

  def total_distance
    self.distance + self.logs.sum(:distance)
  end

  private
  def remove_from_logs
    self.logs.each do |log|
      log.shoe_id = nil
    end
  end

end
