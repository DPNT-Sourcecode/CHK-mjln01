# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)    
    total_price = 0
    skus.split(//).unique.each do |squ|
      quantity = skus.count(sku)
      offer = get_offer(sku)
      price = get_price(sku)
      
    end    

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
