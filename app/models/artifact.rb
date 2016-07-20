class Artifact < ActiveRecord::Base
  belongs_to :site

  has_attached_file :image, styles: {
      medium: ["600x600>", :jpg],
      thumb: ["300x300>", :jpg]
    },
    default_url: "/images/landscape.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :point_type, presence: true
  validates :ui, presence: true, numericality: { only_integer: true }
  validates :max_thickness, presence: true, numericality: { only_integer: true }
  validates :max_length, presence: true, numericality: { only_integer: true }
  validates :max_width, presence: true, numericality: { only_integer: true }
  validates :basal_edge_width, presence: true, numericality: { only_integer: true }
  validates :site_id, presence: true
end
