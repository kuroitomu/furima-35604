FactoryBot.define do
  factory :Items do
    image                { Faker::Lorem.sentence }
    name                 { Faker::Name.name }
    product_explanation  { Faker::Lorem.sentence }
    category_id           {2}
    product_status_id     {3}
    shipping_charges_id   {2}
    prefectures_id        {3}    
    shipping_time_id      {3} 
    price                 {300}
    association :user
   
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image.png'), filename: 'image.png')
    end
  end
end