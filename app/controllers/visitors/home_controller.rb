module Visitors
  class HomeController < VisitorsController
    def index
      @tournaments = Tournament.all
    end
  end
end
