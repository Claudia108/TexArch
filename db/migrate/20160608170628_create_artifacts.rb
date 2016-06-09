class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.integer :ui
      t.string :point_type
      t.integer :max_thickness
      t.integer :max_length
      t.integer :max_width
      t.integer :basal_edge_width
      t.references :site, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
