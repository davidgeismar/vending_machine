class Router
  def initialize(vending_machine, vending_machine_controller)
    @vending_machine = vending_machine
    @vending_machine_controller = vending_machine_controller
    @running = true
  end
  def run
    while @running
      print_menu
      choice = gets.chomp.to_i
      print `clear`
      action(choice)
    end
  end

  private

  def print_menu
    puts "--------------------"
    puts "------- MENU -------"
    puts "--------------------"
    puts "1. choose Products"
    puts "2. Print remaining change "
    puts "3. Add Change"
    puts "4. Add Product"
    puts "please chose an action"
  end

  def action(choice)
    case choice
    when 1 then @vending_machine_controller.choose_product
    when 2 then @vending_machine_controller.print_remaining_change
    when 3 then @vending_machine_controller.add_change
    when 4 then @vending_machine_controller.add_product
    else
      puts "Try again..."
    end
  end

  def give_back_change_to_customer(choice, money_given)
    @vending_machine_controller.give_back_change(choice, money_given)
  end

end
