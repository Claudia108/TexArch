require 'test_helper'

class SiteTest < ActiveSupport::TestCase
  should have_many(:artifacts)
  should validate_presence_of(:name)
  should validate_presence_of(:latitude)
  should validate_presence_of(:longitude)
end
