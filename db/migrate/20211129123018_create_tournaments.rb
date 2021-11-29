class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :title

      t.timestamps
    end
  end
end
