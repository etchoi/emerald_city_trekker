class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name
      t.string :first_name
      t.string :city
      t.string :country
      t.string :email
      t.text :about
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
