class Item
  attr_reader :name, :price, :tax

  def initialize(name, price, product_type)
    @name = name
    @price = price
    #I put some thought into the product_type parameter, I wanted it to be reusable.
    #I thought about passing in the tax amount or product type. As more product
    #types are added, this will change into a case statement, generally becoming
    #much more complicated. However atm I needed to not tax produces.
    @tax = product_type == 'produce' ? 0 : price/10
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
    @items.map(&:tax).inject(&:+)
  end

  def add_item(item)
    @items << item
  end
end
