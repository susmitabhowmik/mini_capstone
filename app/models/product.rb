class Product < ApplicationRecord
def is_discounted?
  if price < 10
    p true
  else
    p false
  end    
 end

 def tax
   tax = price*0.09
   p tax.round(2)
 end

 def total
  total = price + tax
  p total
 end
end
