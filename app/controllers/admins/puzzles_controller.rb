module Admins
	class PuzzlesController < AdminsController
		before_action :set_puzzle, only: %i[ show edit update destroy ]

		def index
		  @puzzles = Puzzle.all
		end

		def show
		  @memory = Memory.new
		  @memory.image_memories.build
		  @memory.text_memories.build
		end

		def new
		  @puzzle = Puzzle.new
		end

		def edit
		end

		def create
		  @puzzle = Puzzle.new(puzzle_params)
		  if @puzzle.save
		  	notice = "Success! Your Puzzle has been updated/created!"
		  else
		  	notice = "Uppps, something went wrong"
		  end
		  redirect_to puzzle_path(@puzzle), notice: notice
		end

		def update
			if @puzzle.update(puzzle_params)
		  		notice = "Success! Your Puzzle has been updated/created!"
		  	else
		  		notice = "Uppps, something went wrong"
		  	end
		  redirect_to puzzle_path(@puzzle), notice: notice
		end

		def destroy
		  @puzzle.destroy
		  respond_to do |format|
		    format.html { redirect_to puzzles_url, notice: "Puzzle was successfully destroyed." }
		    format.json { head :no_content }
		  end
		end

		private
		  # Use callbacks to share common setup or constraints between actions.
		  def set_puzzle
		    @puzzle = Puzzle.find(params[:id])
		  end

		  # Only allow a list of trusted parameters through.
		  def puzzle_params
		    params.require(:puzzle).permit(:title, :description, :pieces, :start_date, :end_date, :image)
		  end
	end
end