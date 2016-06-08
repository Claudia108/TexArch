class RenameColumnInSite < ActiveRecord::Migration
  def change
    remove_column :sites, :type, :integer, default: 0
    add_column :sites, :site_type, :integer, default: 0
  end
end
