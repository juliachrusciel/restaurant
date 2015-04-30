class Party < ActiveRecord::Base
  has_many(:orders)
  has_many(:foods, through: :orders)

  def to_s
    self.to_s
  end

  def price
    total = 0
    self.foods.each do |food|
      total += food.price
    end
    total
  end

end
