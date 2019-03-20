require_relative '../views/vending_machine_view'

class VendingMachineController
  def initialize(vending_machine)
    @vending_machine = vending_machine
    @vending_machine_view = VendingMachineView.new(@vending_machine)
  end

  def list_products
    display_products
  end

  def ask_for_choice
    ask_customer_for_choice
  end

  def print_remaining_change
    @vending_machine_view.display_remaining_change
  end

  def choose_product
    list_products
    choice = ask_customer_for_choice
    money_given = ask_customer_for_money(choice)
    change = @vending_machine.process_order(choice, money_given)
    @vending_machine_view.print_change_to_customer(change)
  end

  def add_change
    print_remaining_change
    id = @vending_machine_view.ask_user_for(:id).to_i
    quantity_to_add = @vending_machine_view.ask_user_for(:quantity).to_i
    coin = @vending_machine.coin_repo.find(id)
    coin.quantity += quantity_to_add
    print_remaining_change
  end

  def add_product
    list_products
    id = @vending_machine_view.ask_user_for(:id).to_i
    quantity_to_add = @vending_machine_view.ask_user_for(:quantity).to_i
    product = @vending_machine.product_repo.find(id)
    product.quantity += quantity_to_add
    list_products
  end

  private

  def ask_customer_for_choice
    valid_selection = false
    while !valid_selection
      id = @vending_machine_view.ask_user_for(:id).to_i
      valid_selection = true if @vending_machine.available_product_ids.include?(id)
    end
    return id
  end

  def ask_customer_for_money(choice)
    enough_money = false
    while !enough_money
      money = @vending_machine_view.ask_user_for(:money).to_i
      enough_money = true if @vending_machine.is_enough_money_for_product?(choice, money)
    end
    return money
  end

  def display_products
    @vending_machine_view.display_products
  end

end
