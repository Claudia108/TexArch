class Site < ActiveRecord::Base
  has_many :artifacts

  enum site_type: %w(public_site private_site)
end
