class Artifact < ActiveRecord::Base
  belongs_to :site
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/rails.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end