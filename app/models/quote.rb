class Quote < ApplicationRecord
  has_one_attached :poster
  has_one_attached :audio

  validates :author, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validate :poster, :validate_poster

  private

  def validate_poster
    return unless poster.attached?

    if !poster.content_type.in?(%w[image/jpeg image/png])
      errors.add(:poster, "must be a JPEG or PNG.")
    elsif poster.blob.byte_size > 1.megabyte
      errors.add(:poster, "is too large. Maximum size is 1 MB.")
    end
  end
end
