class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.attachment :artifact
    end
  end
end
