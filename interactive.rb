require '../parking_lot.rb'
class Interactive
  attr_reader :obj
  def initialize(obj)
    @obj = obj.new
  end
  def perform
    obj.menu
    puts '_'*54
    loop do
      input = gets.chomp
      command, *params = input.split /\s/
      case command
      when /\Amenu\z/i
        obj.menu
      when /\Acreate_parking_lot\z/i
        puts obj.create_parking_lot params[0].to_i
      when /\Apark\z/i
        puts obj.park *params
      when /\Aleave\z/i
        puts obj.leave params[0].to_i
      when /\Astatus\z/i
        puts obj.status
      when /\Aregistration_numbers_for_cars_with_colour\z/i
        puts obj.registration_numbers_for_cars_with_colour *params
      when /\Aslot_numbers_for_cars_with_colour\z/i
        puts obj.slot_numbers_for_cars_with_colour *params
      when /\Aslot_number_for_registration_number\z/i
        puts obj.slot_number_for_registration_number *params
      else
        exit
      end
    end
  end
end

pl = Interactive.new(ParkingLot)
pl.perform
