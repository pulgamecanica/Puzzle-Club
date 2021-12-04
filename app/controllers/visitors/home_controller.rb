module Visitors
  class HomeController < VisitorsController
    before_action :set_puzzle_contender, only: %i[ votes ]
    def index
      @tournaments = Tournament.all
      @puzzle_shelve = Puzzle.all.order(:created_at).max(5)
    end

    def tournaments
      @tournaments = Tournament.all.select { |tournament| tournament.active }
    end

    def votes
      unless @contender.nil?        
        @vote = @contender.votes.build(vote_params)
        if @vote.save
          notice = "Vote was successfully submited!"
        else
          notice = "Invalid username..."
        end
      else
        notice = "Sorry you cannot vote for that contender... :("
      end
      redirect_to visitor_torunaments_path, notice: notice
    end

    private

      def set_puzzle_contender
        @contender = PuzzleContender.find(params[:vote][:puzzle_contender_id])
      end

      def vote_params
        params.require(:vote).permit(:username, :puzzle_contender_id)
      end
  end
end
