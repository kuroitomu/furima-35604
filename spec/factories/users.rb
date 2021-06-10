FactoryBot.define do
  factory :user do
    nickname                  {Faker::Name.initials(number: 2)}
    email                     {Faker::Internet.free_email}
    password                  { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation     {password}
    family_name_full_width    {'漢字'}
    first_name_full_width     {'ひらがな'}
    family_name_kana          {'カタカナ'}
    first_name_kana           {'カタカナ'}
    birthday                  {Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today)}
  end
end