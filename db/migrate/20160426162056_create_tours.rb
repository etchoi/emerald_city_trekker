class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :name
      t.text :description
      t.string :category
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
