class AddFieldToPuzzle < ActiveRecord::Migration[6.1]
  def change
    add_column :puzzles, :finished, :boolean
    add_column :puzzles, :archived, :boolean
  end
end
