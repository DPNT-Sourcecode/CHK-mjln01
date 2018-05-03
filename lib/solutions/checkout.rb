# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)    
    total_price = 0
    skus.split(//).uniq.each do |sku|
      quantity = skus.count(sku)
      offers = get_offer(sku)
      price = get_price(sku)
      return -1 if price.nil?
      if offers.empty?
        total_price = total_price + quantity * price[1]
      else

        total_price = total_price + (quantity / offer[1]) * offer[2] + (quantity % offer[1]) * price[1]
      end      
    end
    total_price
  end

  private

  def get_offers(sku)
    offers = [['A', 3, 130], ['A', 5, 200], ['B', 2, 45]]
    offers.select { |item| item[0] == sku }.sort_by{|obj| obj[1]}.reverse
  end

  def get_free_offers(sku)
    offers = [['E', 2, 'B', 1]]
    free_offers.select { |item| item[0] == sku }
  end

  def get_price(sku)
    prices = [['A', 50], ['B', 30], ['C', 20], ['D', 15]]
    prices.select { |item| item[0] == sku }.first
  end

end
