FactoryGirl.define do
  factory :cart_item do
    cart_id 1
    unit_id 1
    currency_id 1
    size { Faker::Name.name }
    length { Faker::Name.name }
    price 1.5
    priority 1
    event_date { Date.today }
    delivery_date { Date.today }
    return_date { Date.today }
  end
end
