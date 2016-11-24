require './cart'

RSpec.describe Item do
  describe '#tax' do
    context 'when no tax rate is passed' do
      it 'defaults to returning 10% of the price' do
        general_item = Item.new('Mop', 350)
        expect(general_item.tax).to eq(35)
      end
    end

    context 'when tax rate is passed' do
      it 'returns tax rate multiplied by price' do
        general_item = Item.new('Mop', 350, 0.2)
        expect(general_item.tax).to eq(70)
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
  let(:produce_item) { Produce.new('Carrot', 100) }
  let(:general_item) { Item.new('Mop', 350) }

  let(:mixed_cart) do
    cart = Cart.new
    cart.add_item(produce_item)
    cart.add_item(general_item)
    cart
  end

  let(:non_produce_cart) do
    cart = Cart.new
    cart.add_item(general_item)
    cart.add_item(general_item)
    cart
  end

  describe '#items' do
    it 'returns all items that are added to cart' do
      expect(mixed_cart.items).to contain_exactly(produce_item, general_item)
    end
  end

  describe '#subtotal' do
    it 'returns the total amount from the cart without tax' do
      expect(mixed_cart.subtotal).to eq(450)
    end
  end

  describe '#total' do
    it 'return the sum of the cart subtotal and tax' do
      total = mixed_cart.subtotal + mixed_cart.tax
      expect(mixed_cart.total).to eq(total)
    end
  end
end
