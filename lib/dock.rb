require './lib/boat'

class Dock
  attr_reader :name,
              :max_rental_time,
              :dock_transactions

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @dock_transactions = []

  end

  def rent(renter, boat)
    @dock_transactions << [renter, boat]
  end

  def log_hours
    @dock_transactions.each do |data|
      data.first.add_hour
    end
  end

  def return(boat)
    boat.returned
  end

  def revenue
    money = 0
    @dock_transactions.each do |data|
      money += data.first.hours_rented * data.first.price_per_hour
    end
    money
  end
end
