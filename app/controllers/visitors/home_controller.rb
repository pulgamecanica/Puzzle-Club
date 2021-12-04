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
          notice = "Sorry Something went wrong..."
        end
      else
        notice = "Sorry you cannot vote for that contender... :("
      end
      puts "*-" * 100
      puts "    Result: #{notice}"
      puts "    Contender nil?: #{@contender.nil?}"
      puts "*-" * 100
      redirect_to visitor_torunaments_path
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
