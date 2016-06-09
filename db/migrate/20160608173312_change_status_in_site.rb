class ChangeStatusInSite < ActiveRecord::Migration
  def change
    remove_column :sites, :type, :string, default: "public"
    add_column :sites, :type, :integer, default: 0
  end
end
