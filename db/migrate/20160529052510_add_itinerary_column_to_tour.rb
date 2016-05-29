class AddItineraryColumnToTour < ActiveRecord::Migration
  def change
    add_column :tours, :itinerary, :text
  end
end
