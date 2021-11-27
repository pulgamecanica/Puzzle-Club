module Admins
	class ImageMemoriesController < AdminsController
		before_action :set_image_memory

		def update
			if @image_memory.update(image_memory_params)
				redirect_to	 notifications_path, notice: "Image Memory Successfully Updated."
			else
				redirect_to	 notifications_path, notice: "Sorry Something Went wrong."
			end
		end

		def destroy
			if (!(@image_memory.memory.text_memories.any? || @image_memory.memory.image_memories.where.not(id: @image_memory.id).any?))
				@image_memory.memory.destroy
			else			
				@image_memory.destroy
			end
		  	respond_to do |format|
		    	format.html { redirect_to notifications_path, notice: "Image Memory was successfully destroyed." }
		    	format.json { head :no_content }
		  	end
		end

		private

			def image_memory_params
		    	params.require(:image_memory).permit(:active)
			end

			def set_image_memory
		    	@image_memory = ImageMemory.find(params[:id])
			end
	end
end