module Admins
	class MemoriesController < AdminsController
		before_action :set_puzzle
		before_action :set_memory, only: %i[ edit update destroy ]

		def new
			@memory = @puzzle.memories.build
		end

		def create
		  @memory = @puzzle.memories.build(memory_params)

		  if @memory.save
		  	redirect_to puzzle_path(@puzzle), notice: "Success! Your Memory has been updated/created!"
		  else
		 	redirect_to puzzle_path(@puzzle), notice: "Uppps, something went wrong"
		  end
		end

		def destroy
		  @memory.destroy
		  respond_to do |format|
		    format.html { redirect_to puzzle_url, notice: "Memory was successfully destroyed." }
		    format.json { head :no_content }
		  end
		end

		private

		  def set_puzzle
		  	@puzzle = Puzzle.find(memory_params[:puzzle_id])
		  end

		  def set_memory
		    @memory = Memory.find(params[:id])
		  end

		  def memory_params
		    params.require(:memory).permit(:user_names42, :puzzle_id, :start_date, :end_date, image_memories_attributes: [:alt, :image], text_memories_attributes: [:description, :title, :memory_id])
		  end
	end
end