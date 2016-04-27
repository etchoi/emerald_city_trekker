class DeleteRequestedTable < ActiveRecord::Migration
  def change
    drop_table :requesteds
  end
end
