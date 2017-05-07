FactoryGirl.define do
  factory :cart_item do
    cart_id 1
    unit_id 1
    currency_id 1
    name { Faker::Name.name }
    price 1.5
    num_units 1
  end
end
