class ImageMemory < ApplicationRecord
  belongs_to :memory
  has_one_attached :image
end
