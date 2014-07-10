class User < ActiveRecord::Base
  has_many :favorites
  has_many :campgrounds, through: :favorites

  validates :first_name, :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "invalid email"}
  validates :password_hash, length: {minimum: 8}

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
