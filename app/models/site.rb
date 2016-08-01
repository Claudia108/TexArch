class Site < ActiveRecord::Base
  has_many :artifacts
  has_attached_file :image, styles: {
      medium: ["600x600>", :jpg],
      thumb: ["300x300>", :jpg]
    },
    default_url: "/images/landscape_medium.jpg"

  enum site_type: %w(public_site private_site)

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :name, presence: true
end
