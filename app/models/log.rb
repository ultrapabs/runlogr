class Log < ActiveRecord::Base

  validates :user_id, :date, :distance, :duration, presence: true
  validates :notes, length: { maximum: 300 }
  validates :title, length: { maximum: 30 }

  has_many :comments, as: :commentable, dependent: :destroy

  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )

  belongs_to(
    :shoe,
    class_name: "Shoe",
    foreign_key: :shoe_id,
    primary_key: :id
  )

  def username
    self.user.username
  end

  def user_pic
    self.user.profile_pic(:feed)
  end

  def duration_string
    time_remain = self.duration

    if time_remain > 3600
      hours = (time_remain / 3600).floor
      time_remain -= hours * 3600
    else
      hours = 0
    end
    if time_remain > 60
      minutes = (time_remain / 60).floor
      time_remain -= minutes * 60
    else
      minutes = 0
    end
    seconds = time_remain.round(2)
    convert_time_to_string(hours, minutes, seconds)
  end

  def log_hours
    (self.duration / 3600).floor
  end

  def log_minutes
    ((self.duration % 3600).floor / 60).floor
  end

  def log_seconds
    (self.duration % 3600).floor % 60
  end

  def shoe_name
    return "" if self.shoe.nil?
    self.shoe.name
  end

  def convert_time_to_string(h, m, s)
    h < 10 ? hour = "0" + h.to_s : hour = h.to_s
    m < 10 ? min = "0" + m.to_s : min = m.to_s
    s < 10 ? sec = "0" + s.to_s : sec = s.to_s

    hour + ":" + min + ":" + sec
  end

  def pace
    min = (self.duration / (60 * self.distance)).round(2)
    sec = (min - min.floor) * 60
    sec_string = sec.floor.to_i.to_s
    sec_string = "0" + sec_string if sec_string.length == 1
    min.floor.to_s + ":" + sec_string
  end

end
