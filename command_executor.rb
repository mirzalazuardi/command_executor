require './example_app.rb'
class CommandExecutor
  attr_reader :obj
  def initialize(obj)
    @obj = obj
  end
  def perform(command, *params)
    case command
    when /\Amenu\z/i
      display_menu
    #.....
    #when other command
      #EXAMPLE
    when /\Ahello_world\z/i
      puts obj.hello_world
    when /\Agreeting\z/
      puts obj.greeting params[0]
      #THAT YOU CAN CUT
    #execute command
    #.....
    else
      exit
    end
  end
  def display_menu
    puts 'Commands'.center(54)
    puts obj.menu
  end
end

ce = CommandExecutor.new(ExampleApp.new(['menu','hello_world', 'greeting [name]']))
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
  ce.display_menu
  puts '_'*54
  loop do
    input            = gets.chomp
    command, *params = input.split /\s/
    ce.perform(command, *params)
  end
end

