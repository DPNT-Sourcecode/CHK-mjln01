# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)    
    total_price = 0
    skus.split(//).uniq.each do |sku|
      quantity = skus.count(sku)
      offer = get_offer(sku)
      price = get_price(sku)
      if offer.nil?
        total_price = total_price + quantity * price[1]
      else
        total_price = total_price + (quantity / offer[1]) * offer[2] + (quantity % offer[1]) * price[1]
      end      
    end
    total_price
  end

  private

  def get_offer(sku)
    offers = [['A', 3, 130], ['B', 2, 45]]
    offers.select { |item| item[0] == sku }.first
  end

  def get_price(sku)
    prices = [['A', 50], ['B', 30], ['C', 20], ['D', 15]]
    prices.select { |item| item[0] == sku }.first
  end

end
