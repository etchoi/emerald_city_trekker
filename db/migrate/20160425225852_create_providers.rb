class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name
      t.string :email
      t.string :about
      t.string :category
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
