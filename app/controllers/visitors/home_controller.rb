module Visitors
  class HomeController < VisitorsController
    def index
      @tournaments = Tournament.all
      @puzzle_shelve = Puzzle.all.order(:created_at).max(5)
    end
  end
end
