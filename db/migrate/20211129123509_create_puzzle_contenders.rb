class CreatePuzzleContenders < ActiveRecord::Migration[6.1]
  def change
    create_table :puzzle_contenders do |t|
      t.references :puzzle, null: false, foreign_key: true
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
