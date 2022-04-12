class ReceiptCalculator
  TAX_RATE = 0.1

  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(name:, quantity:, price:)
    items.push({name: name, quantity: quantity, price: price})
  end

  def total
    sub_total = items.inject(0) { |sum, item| sum + item[:quantity] * item[:price] }
    sub_total * (1 + TAX_RATE)
  end
end
