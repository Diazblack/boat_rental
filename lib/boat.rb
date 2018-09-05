class Boat
  attr_reader :type,
              :price_per_hour,
              :hours_rented,
              :return

  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
    @hours_rented = 0
    @return = false

  end

  def add_hour
    @hours_rented += 1 if !@return && @hours_rented < 3
  end

  def returned
    @return = true
  end
end
