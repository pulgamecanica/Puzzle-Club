module Admins
	class ImageMemoriesController < AdminsController
		before_action :set_image_memory, only: %i[ update, :destroy ]

		def create
		  @image_memory = ImageMemory.new(memory_params)
		  if @image_memory.save
		  	redirect_to puzzle_path(@image_memory.memory.puzzle), notice: "Success! Your Memory(Image) has been updated/created!"
		  else
		 	redirect_to root_path, notice: "Uppps, something went wrong"
		  end
		end

		def update
			if @image_memory.update(memory_params)
		  		redirect_to puzzle_path(@memory.puzzle), notice: "Success! Your Memory(Image) has been updated/created!"

		  	else
		  		redirect_to edit_puzzle_path(@memory.puzzle), notice: "Uppps, something went wrong"
		  	end
		end

		def destroy
		  @image_memory.destroy
		  respond_to do |format|
		    format.html { redirect_to puzzle_url, notice: "Memory was successfully destroyed." }
		    format.json { head :no_content }
		  end
		end

		private

		  def set_image_memory
		    @image_memory = ImageMemory.find(params[:id])
		  end

		  def memory_params
		    params.require(:image_memory).permit(:image, :alt)
		  end
	end
end