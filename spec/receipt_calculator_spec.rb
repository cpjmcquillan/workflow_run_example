require "spec_helper"

RSpec.describe ReceiptCalculator do
  describe "#add_item" do
    it "adds an item to the receipt" do
      calculator = ReceiptCalculator.new

      calculator.add_item(name: "Pizza", quantity: 1, price: 1000)
      items = calculator.items

      expect(items).to contain_exactly({name: "Pizza", quantity: 1, price: 1000})
    end
  end

  describe "#total" do
    it "calculates the total of the receipt including tax" do
      stub_const("ReceiptCalculator::TAX_RATE", 0.1)
      calculator = ReceiptCalculator.new

      calculator.add_item(name: "Pizza", quantity: 2, price: 1000)
      calculator.add_item(name: "Coke", quantity: 1, price: 500)
      total = calculator.total

      expect(total).to eq(2750)
    end
  end
end
