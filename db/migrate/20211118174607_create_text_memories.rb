class CreateTextMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :text_memories do |t|
      t.string :title
      t.text :description
      t.references :memory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
