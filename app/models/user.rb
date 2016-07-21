class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  before_destroy :send_notification_email

  validates :email,
    presence: true

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :password,
    length: { in: 6..20 }, on: :create

  def full_name
    "#{firstname} #{lastname}"
  end

  def admin?
    admin
  end

  def send_notification_email
    UserMailer.notification_email(@user).deliver
  end

end
