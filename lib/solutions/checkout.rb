# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)    
    total_price = 0
    
    new_skus = skus
    skus.split(//).uniq do |sku|
      free_offers = get_free_offers(sku)
      free_offers.each do |free_offer|
        quantity = skus.count(free_offer[0])
        # puts "Times: #{quantity / free_offer[1]}"
        (quantity / free_offer[1]).times do
          new_skus[new_skus.index(free_offer[2])] = '' unless new_skus.index(free_offer[2]).nil?
          puts "New Skus: #{new_skus}"
        end
      end      
    end
    puts "====== #{new_skus} ====="
    new_skus.split(//).uniq.each do |sku|
      quantity = skus.count(sku)
      offers = get_offers(sku)
      price = get_price(sku)
      return -1 if price.nil?
      if offers.empty?
        total_price = total_price + quantity * price[1]
      else
        offers.each do |offer|
          total_price = total_price + (quantity / offer[1]) * offer[2]
          quantity = quantity % offer[1]
        end
        total_price = total_price + quantity * price[1]
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
    offers = [['E', 2, 'B']]
    offers.select { |item| item[0] == sku }
  end

  def get_price(sku)
    prices = [['A', 50], ['B', 30], ['C', 20], ['D', 15], ['E', 40]]
    prices.select { |item| item[0] == sku }.first
  end

end
