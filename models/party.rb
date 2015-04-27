class Party < ActiveRecord::Base
  has_many(:orders)
  has_many(:foods, through: :orders)

  def to_s
    self.to_s
  end

end
