require 'minitest/autorun'
require 'minitest/pride'

require './lib/dock'
require './lib/renter'
require './lib/boat'

class BoatTest < Minitest::Test
  def test_if_it_exist
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

  def test_if_it_has_attributes
    dock = Dock.new("The Rowing Dock", 3)

    assert_equal "The Rowing Dock", dock.name
    assert_equal 3, dock.max_rental_time
  end

  def test_if_it_can_get_boats_and_renters
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    assert_equal [patrick, kayak_1], dock.rent(patrick,kayak_1)
  end

  def test_if_it_can_charge_no_more_then_max_rental_time
    skip
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

  end
end
