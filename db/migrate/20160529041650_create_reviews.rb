class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.references :tour, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
