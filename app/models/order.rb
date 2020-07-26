class Order < ApplicationRecord
  enum pay_type: {
    "Check"         => 0,
    "Credit card"   => 1,
    "Purches order" => 2
  }
end