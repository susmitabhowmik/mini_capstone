class Product < ApplicationRecord

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 10..500}


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
