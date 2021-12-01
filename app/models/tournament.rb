class Tournament < ApplicationRecord
	has_many :puzzle_contenders, dependent: :destroy
	has_many :puzzles, through: :puzzle_contenders
	has_many :votes, through: :puzzle_contenders
	
	def available_puzzle_contenders
		Puzzle.where.not(id: self.puzzles)
	end
	
	def current_winner
      self.puzzle_contenders.map { |contender| [contender.votes.count, contender]}.group_by { |element| element [0] }.max(3)
    end

    def active
    	start_date < Time.now && end_date > Time.now
    end
end
