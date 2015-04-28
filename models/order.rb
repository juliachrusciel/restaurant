class Order < ActiveRecord::Base
  belongs_to(:party)
  belongs_to(:food)

  def to_s
    self.to_s
  end

end
