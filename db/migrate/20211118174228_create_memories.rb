class CreateMemories < ActiveRecord::Migration[6.1]
  def change
    create_table :memories do |t|
      t.string :user_names42
      t.references :puzzle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
