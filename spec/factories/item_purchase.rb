FactoryBot.define do
  factory :item_purchase do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京猫ビル' }
    phone_number { '0902222222' }
    user_id   { 3 }
    item_id   { 5 }
    token     { 'tok_abcdefghijk00000000000000000' }
  end
end
