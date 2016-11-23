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
    @items.map(&:price).inject(&:+)
  end

  def tax
    @items.inject(0) {|total_tax, item| total_tax + (item.price * (item.tax / 100.0)) }
  end

  def add_item(item)
    @items << item
  end
end

cart = Cart.new
item = Item.new('Zanahorias', 60, 10.5) # tax = 6.3
cart.add_item(item)
item = Item.new('Zanahorias', 10, 1) # tax = 0.2
cart.add_item(item)
puts "Tax: #{cart.tax}"            # 6.4
puts "Sub-total: #{cart.subtotal}" # 70
puts "Total: #{cart.total}"        # 81
