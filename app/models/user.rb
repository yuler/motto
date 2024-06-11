class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  has_many :clock_ins, dependent: :destroy

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true

  normalizes :email, with: ->(email) { email.strip.downcase }

  after_commit :send_welcome_email, on: :create, unless: -> { email.end_with?("@fake.mail") }

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end

  def avatar_url
    Rails.application.routes.url_helpers.rails_blob_url(avatar) if avatar.attached?
  end

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_later
  end

  def as_json(options = {})
    super(options.merge(except: %i[password_digest], methods: %i[avatar_url]))
  end
end
