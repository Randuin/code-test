require './cart'

RSpec.describe Item do
  describe '#tax' do
    context 'when no tax rate is passed' do
      it 'defaults to returning 10% of the price' do
        item = Item.new('Mop', 350)
        expect(item.tax).to eq(35)
      end
    end

    context 'when tax rate is passed' do
      it 'returns tax rate multiplied by price' do
        item = Item.new('Mop', 350, 0.2)
        expect(item.tax).to eq(70)
      end
    end
  end
end

RSpec.describe Produce do
  let(:produce_item) { Produce.new('Carrot', 100) }
  describe '#tax' do
    it 'returns 0' do
      expect(produce_item.tax).to eq(0)
    end
  end
end

RSpec.describe Cart do
  let(:produce_item) { Produce.new('Orange', 150) }
  let(:general_item) { Item.new('Broom', 350) }

  describe '#add_item' do
    it 'correctly adds items to cart' do
      cart = Cart.new
      cart.add_item(produce_item)
      cart.add_item(general_item)
      expect(cart.items).to contain_exactly(produce_item, general_item)
    end
  end

  let(:cart) do
    cart = Cart.new
    cart.add_item(produce_item)
    cart.add_item(general_item)
    cart
  end

  describe '#subtotal' do
    it 'returns the total amount from the cart without tax' do
      expect(cart.subtotal).to eq(500)
    end
  end

  describe '#total' do
    it 'return the sum of the cart subtotal and tax' do
      total = cart.subtotal + cart.tax
      expect(cart.total).to eq(total)
    end
  end
end
