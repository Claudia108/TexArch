class Site < ActiveRecord::Base
  has_many :artifacts

  enum type: [:public_site, :private_site]
end
