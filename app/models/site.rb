class Site < ActiveRecord::Base
  has_many :artifacts

  enum site_type: %w(public_site private_site)

  validates :longitude, presence: true
  validates :latitude, presence: true
  validates :name, presence: true
end
