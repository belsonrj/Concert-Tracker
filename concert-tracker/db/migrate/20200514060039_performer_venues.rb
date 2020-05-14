class PerformerVenues < ActiveRecord::Migration
  def change
    create_table :performer_venues do |t|
      t.integer :performer_id
      t.integer :venue_id
    end
  end
end
