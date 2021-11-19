class CreateImageMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :image_memories do |t|
      t.string :alt
      t.references :memory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
