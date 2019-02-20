require '../parking_lot.rb'
class Run
  attr_reader :obj
  def initialize(obj)
    @obj = obj.new
  end
  def perform(command, *params)
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

pl = Run.new(ParkingLot)
file_name = ARGV[0]
text=File.open(file_name, 'r')
text.each_line do |line|
  command, *params = line.split(' ')
  pl.perform(command, *params)
end

