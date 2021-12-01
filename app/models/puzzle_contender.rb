class PuzzleContender < ApplicationRecord
  belongs_to :tournament
  belongs_to :puzzle
  has_many :votes, dependent: :destroy
  validate :duplicated_puzzle

  private

    def duplicated_puzzle
      if self.tournament.puzzles.where(id: puzzle_id).any?
        errors.add(:puzzle_id, "The puzzle already belongs to this Tournament")
      end
    end
end
