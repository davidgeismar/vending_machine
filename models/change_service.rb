class ChangeService
  def initialize(coin_repo, change_needed)
    @coin_repo = coin_repo
    @changed_needed = change_needed
  end

  def compute_change
    return nil if @changed_needed  == 0
    change_composition = initialize_change_composition
    remaining_change_to_give = @changed_needed
    @coin_repo.coins.sort_by(&:value).reverse.each do |coin|
      while should_give_change_of_this_kind?(coin, remaining_change_to_give)
        remaining_change_to_give -= coin.value
        coin.quantity -= 1
        change_composition[coin.denomination] += 1
      end
    end
    change_composition
  end

  private
  
  def should_give_change_of_this_kind?(coin, remaining_change)
    (coin.quantity > 0) && (remaining_change - coin.value >= 0)
  end

  def initialize_change_composition
    change_composition = {}
    @coin_repo.coins.each do |coin|
      change_composition[coin.denomination] = 0
    end
    return change_composition
  end
end
