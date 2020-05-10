class Performers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :name
      t.string :genre
      t.integer :times_seen
    end
  end
end
