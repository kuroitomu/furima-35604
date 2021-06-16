FactoryBot.define do
  factory :item do
    name                  { Faker::Name.name }
    product_explanation  { Faker::Lorem.sentence }
    category_id           {2}
    product_status_id     {3}
    shipping_charges_id   {2}
    prefectures_id        {3}    
    shipping_time_id      {3} 
    price                 {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/item_image.png'), filename: 'item_image.png')
    end
  end
end