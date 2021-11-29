class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.references :puzzle_contender, null: false, foreign_key: true
      t.string :username

      t.timestamps
    end
  end
end
