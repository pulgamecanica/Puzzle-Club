class CreateContributors < ActiveRecord::Migration[6.1]
  def change
    create_table :contributors do |t|
      t.references :puzzle, null: false, foreign_key: true
      t.boolean :is_finished, default: false
      t.datetime :finish_date
      t.timestamps
    end
  end
end
