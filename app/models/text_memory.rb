class TextMemory < ApplicationRecord
  belongs_to :memory
  validates :title, :description, presence: true
end
