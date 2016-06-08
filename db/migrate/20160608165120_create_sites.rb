class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :longitude
      t.string :latitude
      t.string :name
      t.string :type, default: "public"

      t.timestamps null: false
    end
  end
end
