require_relative('./change_service.rb')
class VendingMachine
  attr_accessor :product_repo, :coin_repo
  def initialize(product_repo, coin_repo)
    @product_repo = product_repo
    @coin_repo = coin_repo
  end

  def process_order(choice, money_given)
    product = product_repo.find(choice)
    product.sell
    change_needed = money_given - product.price
    ChangeService.new(@coin_repo, change_needed).compute_change
  end

  def available_product_ids
    product_repo.products.map{|product| product.id if product.available?}
  end

  def is_enough_money_for_product?(choice, money_provided)
    product_repo.find(choice).price <= money_provided
  end


end
