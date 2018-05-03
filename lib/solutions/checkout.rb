# noinspection RubyUnusedLocalVariable
class Checkout

  def checkout(skus)
    items = [['A', 50], ['B',30], ['C', 20], ['D', 15]]
    offers = [['A', 3, 130], ['B', 2, 45]]
    total_price = 0
    skus.unique.each do |sku|
      count = skus.count(sku)
      total_price = 
    end
  end

end
