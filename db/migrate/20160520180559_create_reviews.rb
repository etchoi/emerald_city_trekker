class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :content
      t.references :user, index: true, foreign_key: true
      t.integer :guide

      t.timestamps null: false
    end
  end
end
