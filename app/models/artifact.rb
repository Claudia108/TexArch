class Artifact < ActiveRecord::Base
  belongs_to :site
  has_attached_file :image, styles: { medium: "600x600>", thumb: "300x300>" }, default_url: "/images/rails.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  # validates_attachment_content_type :image, { content_type: ["image/jpeg", "image/gif", "image/png", "image/tif"] }
  validates :point_type, presence: true
end
