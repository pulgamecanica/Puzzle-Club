module Visitors
  class PuzzlesController < VisitorsController

    def show
      @puzzle = Puzzle.find(params[:id])
    end

    def index
    end
  end
end