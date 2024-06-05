class Quote < ApplicationRecord
  has_one_attached :poster
  has_one_attached :audio
end
