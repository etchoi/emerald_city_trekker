class CreateRequesteds < ActiveRecord::Migration
  def change
    create_table :requesteds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tour, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
