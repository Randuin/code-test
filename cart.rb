class Item
  attr_reader :name, :price, :attributes

  def initialize(name, price, attributes)
    @name = name
    @price = price
    @attributes = attributes
  end
end

class Cart
  attr_reader :items, :subtotal, :tax, :tax_rate

  def initialize(tax_rate = 0.1)
    @items = []
    @subtotal = 0
    @tax = 0
    @tax_rate = tax_rate
  end

  def total
    subtotal + tax
  end

  def add_item(item)
    items << item

    unless item.attributes[:type] == :produce
      @tax += item.price * tax_rate
    end

    @subtotal += item.price
  end
end
