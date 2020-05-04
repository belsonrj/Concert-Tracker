class Venues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
    end
  end
end
