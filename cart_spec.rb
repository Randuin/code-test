require './cart'

RSpec.describe Cart do
  let(:produce_item) { Item.new('Carrot', 100, { :type => :produce }) }
  let(:cleaning_item) { Item.new('Mop', 350, { :type => :cleaning }) }

  let(:mixed_cart) do
    cart = Cart.new
    cart.add_item(produce_item)
    cart.add_item(cleaning_item)
    cart
  end

  let(:non_produce_cart) do
    cart = Cart.new
    cart.add_item(cleaning_item)
    cart.add_item(cleaning_item)
    cart
  end

  describe '#subtotal' do
    it 'returns the total amount from the cart without tax' do
      expect(mixed_cart.subtotal).to eq(450)
    end
  end

  describe '#total' do
    context 'when cart includes non-produce only' do
      it 'returns total amount from cart with tax on all items' do
        expect(non_produce_cart.total).to eq(770)
      end
    end

    context 'when cart includes non-produce and produce' do
      it 'returns total amount from cart with tax on non-produce only' do
        expect(mixed_cart.total).to eq(485)
      end
    end
  end
end
