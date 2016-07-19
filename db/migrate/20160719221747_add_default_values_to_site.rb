class AddDefaultValuesToSite < ActiveRecord::Migration
  def change
    change_column :sites, :description, :string, default: "no description available"
    change_column :sites, :trinominal, :string, default: "no trinominal available"
  end
end
