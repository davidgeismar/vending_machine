require 'csv'
require_relative '../models/coin'

class CoinRepository
  attr_accessor :coins
  def initialize(csv_file)
    @csv_file = csv_file
    @coins = []
    @next_id = 1
    load_csv
  end

  def find(id)
    @coins.find { |coin| coin.id == id }
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:denomination] = row[:denomination]
      row[:value] = row[:value].to_i
      row[:quantity] = row[:quantity].to_i
      @coins << Coin.new(row)
      @next_id = row[:id]
    end
    @next_id += 1
  end
end
