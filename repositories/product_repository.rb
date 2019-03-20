require 'csv'
require_relative '../models/product'

class ProductRepository
  attr_accessor :products
  def initialize(csv_file)
    @csv_file = csv_file
    @products = []
    @next_id = 1
    load_csv
  end

  def find(id)
    @products.find { |product| product.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:name] = row[:name]
      row[:price] = row[:price].to_i
      row[:quantity] = row[:quantity].to_i
      @products << Product.new(row)
      @next_id = row[:id]
    end
    @next_id += 1
  end
end
