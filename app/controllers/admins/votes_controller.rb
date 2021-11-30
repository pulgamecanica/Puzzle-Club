module Admins
	class VotesController < AdminsController
		before_action :set_vote, only: [:destroy]
		before_action :set_contender, only: [:new, :create]

		def create
			@vote = @contender.votes.build
			@vote.update(username: vote_params["username"])
			if @vote.save
				redirect_to tournament_path(@vote.puzzle_contender.tournament_id), notice: "Contender succesfully added to Tournament!" 
			else
				redirect_to tournament_path(PuzzleContender.find(params["puzzle_contender_id"]).tournament_id), notice: "Sorry the element couldn't be added to the Tournament :("
			end
		end

		def destroy
			tournament = @vote.tournament 
			@vote.destroy
			redirect_to tournament_path(tournament), notice: "Vote succesfully removed from tournament!"
		end

		private

			def set_contender
				@contender = PuzzleContender.find(params["puzzle_contender_id"])
			end
			def set_vote
				@vote = Vote.find(params[:id])
			end

			def vote_params
				params.require(:vote).permit(:username, :puzzle_contender_id, :vote)
			end
	end
end
