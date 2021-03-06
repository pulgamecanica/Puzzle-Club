class Memory < ApplicationRecord
  has_many :image_memories, dependent: :destroy
  has_many :text_memories, dependent: :destroy
  belongs_to :puzzle
  accepts_nested_attributes_for :image_memories, :text_memories
  validates :user_names42, presence: true

  def active_memories
    image_memories.where(active: true).count + text_memories.where(active: true).count > 0 ? true : nil
  end
end
