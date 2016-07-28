require 'test_helper'

class ArtifactTest < ActiveSupport::TestCase
  should belong_to(:site)
  should validate_presence_of(:point_type)
  should validate_presence_of(:ui)
  should validate_presence_of(:max_thickness)
  should validate_presence_of(:max_length)
  should validate_presence_of(:max_width)
  should validate_presence_of(:basal_edge_width)
  should validate_presence_of(:site_id)

  should allow_value(10).for(:max_thickness)
  should_not allow_value("@hello").for(:max_thickness)
  should_not allow_value(10.45).for(:max_thickness)

  should allow_value(10).for(:max_length)
  should_not allow_value("hello").for(:max_length)
  should_not allow_value(10.45).for(:max_length)

  should allow_value(10).for(:max_width)
  should_not allow_value("hello").for(:max_width)
  should_not allow_value(10.45).for(:max_width)

  should allow_value(10).for(:basal_edge_width)
  should_not allow_value("hello").for(:basal_edge_width)
  should_not allow_value(10.45).for(:basal_edge_width)
end
