class AdminsController < ApplicationController
	before_action :authenticate_admin!, :notifications_count
	layout 'admin'

	def admin_home
		@puzzles = Puzzle.all
		@total_notifications = ImageMemory.where(active: false).count + TextMemory.where(active: false).count
	end

	def notifications
		@image_memories = ImageMemory.where(active: false)
		@text_memories = TextMemory.where(active: false)
	end

	private

		def notifications_count
			@notifications_count = ImageMemory.where(active: false).count + TextMemory.where(active: false).count
		end
end
