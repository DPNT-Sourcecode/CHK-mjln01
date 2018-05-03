# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)

    total_price = 0    
    new_skus = skus
    ##### Handle for Free Offers #####
    skus.split(//).uniq.each do |sku|
      free_offers = get_free_offers(sku)
      free_offers.each do |free_offer|
        quantity = skus.count(free_offer[0])
        if sku != free_offer[2]
          (quantity / free_offer[1]).times do
            new_skus[new_skus.index(free_offer[2])] = '' unless new_skus.index(free_offer[2]).nil?
          end
        else
          loop do
            quantity = quantity - free_offer[1]
            break if quantity <= 0 
            quantity = quantity - 1
            new_skus[new_skus.index(free_offer[2])] = '' unless new_skus.index(free_offer[2]).nil?
          end
        end
      end
    end

    ##### Handle for Group Offers  #####
    skus = new_skus
    skus.split(//).uniq.each do |sku|
      group_offers = get_group_offers(sku)

      group_offers.each do |group_offer|
        loop do
          new_skus_ary = new_skus.split(//).uniq

          group_skus = new_skus_ary & group_offer[0]        
          break if group_skus.count < group_offer[1]

          total_price = total_price + group_offer[2]          
          group_offer[1].times do |i|
            new_skus[new_skus.index(group_skus[i])] = ''
          end
        end
      end
    end

    #### Handle for Multiple Offer 
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




  ##### From database #####
  def get_offers(sku)
    offers = [
      ['A', 3, 130], ['A', 5, 200], 
      ['B', 2, 45],
      ['H', 5, 45], ['H', 10, 80],
      ['K', 2, 150], 
      ['P', 5, 200],
      ['Q', 3, 80],
      ['V', 2, 90], ['V', 3, 130]
    ]
    offers.select { |item| item[0] == sku }.sort_by{|obj| obj[1]}.reverse
  end

  def get_free_offers(sku)
    offers = [
      ['E', 2, 'B'], ['F', 2, 'F'], ['N', 3, 'M'], ['R', 3, 'Q'], ['U', 3, 'U']
    ]
    offers.select { |item| item[0] == sku }
  end

  def get_price(sku)
    prices = [
      ['A', 50], ['B', 30], ['C', 20], ['D', 15], ['E', 40], ['F', 10], ['G', 20], ['H', 10], ['I', 35], 
      ['J', 60], ['K', 70], ['L', 90], ['M', 15], ['N', 40], ['O', 10], ['P', 50], ['Q', 30], ['R', 50],
      ['S', 20], ['T', 20], ['U', 40], ['V', 50], ['W', 20], ['X', 17], ['Y', 20], ['Z', 21]
    ]
    prices.select { |item| item[0] == sku }.first
  end

  def get_group_offers(sku)
    group_offers = [
        [['S', 'T', 'X', 'Y', 'Z'], 3, 45]
      ]
    group_offers.select { |item| item[0].include?(sku) }
  end

end
