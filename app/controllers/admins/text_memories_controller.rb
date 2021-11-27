module Admins
	class TextMemoriesController < AdminsController
		before_action :set_text_memory

		def update
			if @text_memory.update(text_memory_params)
				redirect_to	 notifications_path, notice: "Text Memory Successfully Updated."
			else
				redirect_to	 notifications_path, notice: "Sorry Something Went wrong."
			end
		end

		def destroy
			if (!(@text_memory.memory.image_memories.any? || @text_memory.memory.text_memories.where.not(id: @text_memory.id).any?))
				@text_memory.memory.destroy
			else			
				@text_memory.destroy
			end
		  	respond_to do |format|
		    	format.html { redirect_to notifications_path, notice: "Text Memory was successfully destroyed." }
		    	format.json { head :no_content }
		  	end
		end

		private

			def text_memory_params
		    	params.require(:text_memory).permit(:active)
			end

			def set_text_memory
		    	@text_memory = TextMemory.find(params[:id])
			end

	end
end