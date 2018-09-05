require 'minitest/autorun'
require 'minitest/pride'

require './lib/boat'

class BoatTest < Minitest::Test
  def test_if_it_exist
    kayak = Boat.new(:kayak , 20)

    assert_instance_of Boat, kayak
  end

  def test_if_it_has_attribute
    kayak = Boat.new(:kayak , 20)

    assert_equal :kayak, kayak.type
    assert_equal 20, kayak.price_per_hour
  end

  def test_if_it_can_get_and_increase_hours_rented
    kayak = Boat.new(:kayak , 20)

    assert_equal 0 , kayak.hours_rented

    kayak.add_hour

    assert_equal 1, kayak.hours_rented

    kayak.add_hour

    assert_equal 2, kayak.hours_rented

    kayak.add_hour

    assert_equal 3, kayak.hours_rented
  end

  def test_if_a_boat_can_be_returned
    kayak = Boat.new(:kayak , 20)

    assert_equal 0 , kayak.hours_rented
    kayak.add_hour
    kayak.add_hour
    kayak.add_hour
    kayak.returned

    assert_equal true, kayak.return

  end

end
