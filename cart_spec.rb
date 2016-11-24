require './cart'

RSpec.describe Cart do
  let(:item) { Item.new('Carrot', 100, {:type => :produce}) }

  describe '#subtotal' do
    it 'returns the total amount from the cart without tax' do
      cart = Cart.new
      cart.add_item(item)
      cart.add_item(item)
      expect(cart.subtotal).to eq(200)
    end
  end

  # 1) Implement the code that passes this test, assume tax rate of 10%
  describe '#total' do
    it 'returns the total amount from the cart with tax' do
      cart = Cart.new
      cart.add_item(item)
      cart.add_item(item)
      expect(cart.total).to eq(220)
    end
  end

  # 2) Implement the idea that some items are produce and do not incur tax and write the tests that relate to this behavior. Feel free to change anything, add methods, delete methods, add classes, delete classes.
end
