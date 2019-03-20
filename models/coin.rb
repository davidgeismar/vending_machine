class Coin
  attr_accessor :id, :denomination, :value, :quantity
  def initialize(attributes={})
    @id = attributes[:id]
    @denomination= attributes[:denomination]
    @value = attributes[:value]
    @quantity = attributes[:quantity]
  end
end
