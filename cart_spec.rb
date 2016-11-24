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

  describe '#items' do
    it 'returns all items that are added to cart' do
      expect(mixed_cart.items).to contain_exactly(produce_item, cleaning_item)
    end
  end

  describe '#subtotal' do
    it 'returns the total amount from the cart without tax' do
      expect(mixed_cart.subtotal).to eq(450)
    end
  end

  describe '#tax' do
    context 'when cart includes non-produce only' do
      it 'returns total tax of all items' do
        expect(non_produce_cart.tax).to eq(70)
      end
    end

    context 'when cart includes non-produce and produce' do
      it 'returns total tax of non-produce items only' do
        expect(mixed_cart.tax).to eq(35)
      end
    end
  end

  describe '#total' do

  end
end
