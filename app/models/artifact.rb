class Artifact < ActiveRecord::Base
  belongs_to :site
  has_attached_file :image, styles: { medium: "600x600>", thumb: "300x300>" }, default_url: "/images/landscape.jpg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :point_type, presence: true
end
