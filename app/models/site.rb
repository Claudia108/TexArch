class Site < ActiveRecord::Base
  has_many :artifacts

  enum site_type: [:public_site, :private_site]
end
