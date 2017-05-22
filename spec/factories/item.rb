FactoryGirl.define do
  factory :item, class: Item do
    category_id 1
    name { Faker::Name.name }
    detail "Pink Gown"
    currency_id 1
    hire_price 235.0
    retail_price 1539.0
    designer
  end
end
