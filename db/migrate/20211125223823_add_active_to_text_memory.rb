class AddActiveToTextMemory < ActiveRecord::Migration[6.1]
  def change
    add_column :text_memories, :active, :boolean, default: false
  end
end
