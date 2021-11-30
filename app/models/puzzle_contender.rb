class PuzzleContender < ApplicationRecord
  belongs_to :tournament
  belongs_to :puzzle
  has_many :votes, dependent: :destroy
end
