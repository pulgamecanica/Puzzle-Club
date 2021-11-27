class AddActiveToImageMemory < ActiveRecord::Migration[6.1]
  def change
    add_column :image_memories, :active, :boolean, default: false
  end
end
