class CreateScheduleds < ActiveRecord::Migration
  def change
    create_table :scheduleds do |t|
      t.date :tour_date
      t.references :user, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.references :tour, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
