require 'minitest/autorun'
require 'minitest/pride'

require './lib/dock'
require './lib/renter'
require './lib/boat'
require 'pry'

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

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)

  assert_equal [[kayak_1, patrick], [kayak_2, patrick]], dock.dock_transactions
  end

  def test_if_it_can_get_log_hours_and_return_boats_and_return_revenue
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)

    dock.log_hours

    dock.rent(canoe, patrick)

    dock.log_hours

    assert_equal 2, kayak_1.hours_rented
    assert_equal 2, kayak_2.hours_rented
    assert_equal 1, canoe.hours_rented

    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)

    assert_equal true, kayak_1.return
    assert_equal true, kayak_2.return
    assert_equal true, canoe.return

    assert_equal 105, dock.revenue

  end

  def test_if_it_can_charge_no_more_then_max_rental_time
    dock = Dock.new("The Rowing Dock", 3)
    kayak_1 = Boat.new(:kayak, 20)
    kayak_2 = Boat.new(:kayak, 20)
    canoe = Boat.new(:canoe, 25)
    sup_1 = Boat.new(:standup_paddle_board, 15)
    sup_2 = Boat.new(:standup_paddle_board, 15)
    patrick = Renter.new("Patrick Star", "4242424242424242")
    eugene = Renter.new("Eugene Crabs", "1313131313131313")

    dock.rent(kayak_1, patrick)
    dock.rent(kayak_2, patrick)
    dock.log_hours
    dock.rent(canoe, patrick)
    dock.log_hours
    dock.return(kayak_1)
    dock.return(kayak_2)
    dock.return(canoe)

    dock.rent(sup_1, eugene)
    dock.rent(sup_2, eugene)
    dock.log_hours
    dock.log_hours
    dock.log_hours
    dock.log_hours
    dock.log_hours
    dock.return(sup_1)
    dock.return(sup_2)

    assert_equal 195, dock.revenue
  end
end
