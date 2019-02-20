#require './path-to/app_class.rb'
class CommandExecutor
  attr_reader :obj
  def initialize(obj)
    @obj = obj.new
  end
  def perform(command, *params)
    case command
    when /\Amenu\z/i
      obj.menu
    #.....
    #when other command
    #execute command
    #.....
    else
      exit
    end
  end
end

ce = CommandExecutor.new(AppClass)
#FILE MODE
if !!ARGV[0]
  file_name = ARGV[0]
  text=File.open(file_name, 'r')
  text.each_line do |line|
    command, *params = line.split(' ')
    ce.perform(command, *params)
  end
else
#INTERACTIVE MODE
  ce.menu
  puts '_'*54
  loop do
    input            = gets.chomp
    command, *params = input.split /\s/
    ce.perform(command, *params)
  end
end

