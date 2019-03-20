class VendingMachineView
  def initialize(vending_machine)
    @vending_machine = vending_machine
  end
  def display_products
    @vending_machine.product_repo.products.each do |product|
       puts "#{product.id} #{product.name} #{product.price} Q: #{product.quantity}" if product.available?
    end
  end

  def display_remaining_change
    @vending_machine.coin_repo.coins.each do |coin|
      puts "#{coin.id} - #{coin.denomination} : #{coin.quantity}"
    end
  end

  def print_change_to_customer(change)
     if change.nil?
       puts("no change")
     else
       change.each do |key, value|
         puts("#{key} : #{value} coins") if value > 0
       end
     end
     puts("thank you for using our Vending machine")
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end
end
