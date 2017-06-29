require 'pry'

class CashRegister
  attr_accessor :total, :discount, :transaction
  attr_reader :items

  def initialize(discount= 0)
    @total = 0
    @discount = discount
    @items = []
    @transaction = []
  end

  def add_item(title, price, quantity= 1)
    @total += price * quantity
    quantity.times {@items << title}
    @transaction << {title => (price * quantity)}
  end

  def apply_discount
    if discount > 0
      @total -= total * (discount/100.00)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= @transaction.pop.values[0]
  end
end
