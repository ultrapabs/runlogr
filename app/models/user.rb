class User < ActiveRecord::Base

  include PgSearch
  pg_search_scope :search_by_username_or_desc,
                  against: [:username, :description],
                  using: { tsearch: {prefix: true} }

  validates :email, :username, :session_token, :pw_digest, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  validates :description, length: { maximum: 100 }

  has_attached_file :profile_pic, styles: { main: "200x200", feed: "80x80" }, :default_url => "/images/:style/bears.png"
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/
  attr_reader :password

  after_initialize :ensure_session_token

  has_many(
    :comments,
    class_name: "Comment",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :blogs,
    class_name: "Blog",
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many(
    :logs,
    class_name: "Log",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :shoes,
    class_name: "Shoe",
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :follows_follows,
    class_name: "Follow",
    foreign_key: :follower_id,
    primary_key: :id
  )

  has_many(
    :follows_leads,
    class_name: "Follow",
    foreign_key: :leader_id,
    primary_key: :id
  )

  has_many :followers, through: :follows_leads
  has_many :leaders, through: :follows_follows

  has_many :followed_blogs, through: :follows_follows, source: :leader_blogs
  has_many :followed_logs, through: :follows_follows, source: :leader_logs

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(user_login, password)
    user = User.find_by(username: user_login)
    user = User.find_by(email: user_login) if user.nil?
    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.find_or_create_by_auth_hash(auth_hash)
    user = User.find_by(
      provider: auth_hash[:provider],
      uid: auth_hash[:uid]
    )

    unless user
      user = User.new(
        provider: auth_hash[:provider],
        uid: auth_hash[:uid],
        username: auth_hash[:info][:nickname]
      )
    end

    user
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.pw_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.pw_digest).is_password?(password)
  end

  def total_distance
    self.logs.sum(:distance)
  end

  def followed_by?(user)
    self.followers.include?(user)
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end



end
