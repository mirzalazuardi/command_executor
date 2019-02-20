class ExampleApp
  attr_reader :menu_list
  def initialize(menu_list)
    @menu_list = menu_list
  end

  def menu
    menu_list.map{ |x| "- #{x} "}.join("\n")
  end

  def hello_world
    "Hello World"
  end

  def greeting(name)
    "Hello #{name}"
  end
end
