class Item
  attr_reader :name, :price, :tax

  def initialize(name, price, tax = 0)
    @name = name
    @price = price
    @tax = tax
  end
end

class Cart
  def initialize
    @items = []
  end

  def total
    subtotal + tax
  end

  def subtotal
    @items.map(&:price).inject(0, :+)
  end

  def tax
    @items.inject(0) {|total_tax, item| total_tax + (item.price * (item.tax / 100.0)) }
  end

  def add_item(item)
    @items << item
  end
end
