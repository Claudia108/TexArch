class AddArtifactIdToImage < ActiveRecord::Migration
  def change
    add_reference :images, :artifact, index: true, foreign_key: true
  end
end
