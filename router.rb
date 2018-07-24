# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      # 1. print the menu
      choice = display_menu
      # 2. Execute the adequate meals_controller action
      execute(choice)
    end
  end

  private

  def display_menu
    puts "What do you want to do next?"
    puts "1. List all the meals"
    puts "2. Add a meal"
    puts "3. List all the customers"
    puts "4. Add a customer"
    puts "5. Exit the program"
    gets.chomp.to_i
  end

  def execute(choice)
    case choice
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 5 then @running = false
    end
  end
end
