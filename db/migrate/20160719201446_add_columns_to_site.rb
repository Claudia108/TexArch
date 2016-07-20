class AddColumnsToSite < ActiveRecord::Migration
  def change
    add_column :sites, :trinominal, :string
    add_column :sites, :description, :string
    add_attachment :sites, :image
  end
end
