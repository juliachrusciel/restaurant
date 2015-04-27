class Order < ActiveRecord::Base
  belongs_to(:party)
  has_many(:foods)

  def to_s
    self.to_s
  end

end
