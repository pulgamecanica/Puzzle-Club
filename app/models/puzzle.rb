class Puzzle < ApplicationRecord
	has_many :memories, dependent: :destroy
	has_one_attached :image
end
