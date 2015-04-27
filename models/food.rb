class Food < ActiveRecord::Base
  belongs_to(:party, through: :orders)
  has_many(:orders)

  def to_s
    self.to_s
  end

end
