class Puzzle < ApplicationRecord
	has_many :memories, dependent: :destroy
	has_many :contributors, dependent: :destroy
	has_many :puzzle_contenders, dependent: :destroy
	has_one_attached :image
end
