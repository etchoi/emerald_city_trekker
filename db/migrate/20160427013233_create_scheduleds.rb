class CreateScheduleds < ActiveRecord::Migration
  def change
    create_table :scheduleds do |t|
      t.references :traveler, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
