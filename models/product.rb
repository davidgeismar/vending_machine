class Product
  attr_accessor :id, :name, :price, :quantity
  def initialize(attributes={})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
    @quantity = attributes[:quantity]
  end

  def available?
    self.quantity > 0
  end

  def sell
    @quantity -= 1
  end

end
