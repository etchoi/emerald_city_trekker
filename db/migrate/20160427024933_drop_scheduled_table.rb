class DropScheduledTable < ActiveRecord::Migration
  def change
    drop_table :scheduleds
  end
end
