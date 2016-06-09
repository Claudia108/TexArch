class AddImageToArtifact < ActiveRecord::Migration
  def change
    add_attachment :artifacts, :image
  end
end
