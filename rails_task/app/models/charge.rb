class Charge < ActiveRecord::Base

  belongs_to :customer

  def largest_amount_attr
    charges.maximum(:amount)
  end
end
