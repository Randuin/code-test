require './cart'
require 'pry'

RSpec.describe Cart do
  let(:carrot) { Item.new('Carrot', 100, 'produce') }
  let(:coke) { Item.new('Coke', 100, 'soda') }
  let(:cart) { Cart.new }

  describe '#subtotal' do
    it 'returns the subtotal amount from the cart without tax' do
      cart.add_item(coke)
      cart.add_item(coke)
      expect(cart.subtotal).to eq(200)
    end
  end

  # 1) Implement the code that passes this test, assume tax rate of 10%
  describe '#total' do
    it 'returns the total amount from the cart with tax' do
      cart.add_item(coke)
      cart.add_item(coke)
      expect(cart.total).to eq(220)
    end
  end

  # 2) Implement the idea that some items are produce and do not incur tax and write the tests that relate to this behavior. Feel free to change anything, add methods, delete methods, add classes, delete classes.
  describe '#tax' do
    it 'returns the tax amount from the cart with tax for some items, and without tax for others' do
      cart.add_item(coke)
      cart.add_item(coke)
      cart.add_item(carrot)
      expect(cart.total).to eq(320)
    end
  end
end
