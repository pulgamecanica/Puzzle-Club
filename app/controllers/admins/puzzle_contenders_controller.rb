module Admins
	class PuzzleContendersController < AdminsController
		before_action :set_puzzle_contender, only: [:destroy]

		def create
			@puzzle_contender = PuzzleContender.new(puzzle_contender_params)
			if @puzzle_contender.save
				redirect_to tournament_path(@puzzle_contender.tournament_id), notice: "Contender succesfully added to Tournament!" 
			else
				redirect_to tournament_path(puzzle_contender_params["tournament_id"]), notice: "Sorry the element couldn't be added to the Tournament :("
			end
		end

		def destroy
			tournament = @puzzle_contender.tournament 
			@puzzle_contender.destroy
			redirect_to tournament_path(tournament), notice: "Contender succesfully removed from tournament!"
		end

		private

			def set_puzzle_contender
				@puzzle_contender = PuzzleContender.find(params[:id])
			end

			def puzzle_contender_params
				params.require(:puzzle_contender).permit(:puzzle_id, :tournament_id)
			end
	end
end