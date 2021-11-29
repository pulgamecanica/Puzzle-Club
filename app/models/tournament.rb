class Tournament < ApplicationRecord
	has_many :puzzle_contenders, dependent: :destroy
end
