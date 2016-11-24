class Item
  attr_reader :name, :price, :attributes

  def initialize(name, price, attributes)
    @name = name
    @price = price
    @attributes = attributes
  end
end

class Cart
  TAX_RATE = 0.1

  attr_reader :items, :subtotal, :tax

  def initialize
    @items = []
    @subtotal = 0
    @tax = 0
  end

  def total
    subtotal + tax
  end

  def add_item(item)
    items << item

    @tax += item.price * TAX_RATE
    @subtotal += item.price
  end

end
