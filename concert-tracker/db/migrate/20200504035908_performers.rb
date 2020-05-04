class Performers < ActiveRecord::Migration
  def change
    create_table :performers do |t|
      t.string :name
      t.string :genre
    end
  end
end
