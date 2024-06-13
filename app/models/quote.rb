class Quote < ApplicationRecord
  has_one_attached :poster
  has_one_attached :audio
  has_one_attached :video

  validates :author, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validate :poster, :validate_poster

  # TODO: custom today
  def self.today
    last
    # where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end

  # TODO: optimize
  def poster_url
    attachment_url(poster)
  end

  def audio_url
    attachment_url(audio)
  end

  def video_url
    attachment_url(video)
  end

  private

  def validate_poster
    return unless poster.attached?

    if !poster.content_type.in?(%w[image/png image/jpg image/jpeg])
      errors.add(:poster, "must be a JPEG or PNG.")
    elsif poster.blob.byte_size > 1.megabyte
      errors.add(:poster, "is too large. Maximum size is 1 MB.")
    end
  end

  def attachment_url(attachment)
    Rails.application.routes.url_helpers.rails_blob_url(attachment) if attachment.attached?
  end
end
