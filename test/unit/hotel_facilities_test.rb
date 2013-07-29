require 'test_helper'

class HotelFacilitiesTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert HotelFacilities.new.valid?
  end
end
