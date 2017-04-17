FactoryGirl.define do
  factory :item, class: Item do
    category_id 1
    description "This Item is specifically made for basketball players"
    name { Faker::Name.name }
    summary "Floral Embroidered Illusion Neckline Gown"
    detail "Pink Gown"
    currency_id 1
    hire_price 235.0
    retail_price 1539.0
  end
end
