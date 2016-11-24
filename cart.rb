class Item
  attr_reader :name, :price

  def initialize(name, price, tax_rate = 0.1)
    @name = name
    @price = price
    @tax_rate = tax_rate
  end

  def tax
    price * @tax_rate
  end
end

class Produce < Item
  def tax
    0
  end
end

class Cart
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

    @tax += item.tax
    @subtotal += item.price
  end
end
