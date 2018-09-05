require 'minitest/autorun'
require 'minitest/pride'

require './lib/dock'

class BoatTest < Minitest::Test
  def test_if_it_exist
    dock = Dock.new("The Rowing Dock", 3)

    assert_instance_of Dock, dock
  end

end
