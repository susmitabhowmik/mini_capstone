class Product < ApplicationRecord
 def is_discounted?
  if price < 10
    p true
  else
    p false
  end    
 end
end
