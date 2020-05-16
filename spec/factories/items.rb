FactoryBot.define do
  factory :item do
    name { Faker::Device.model_name }
    description { Faker::TvShows::RickAndMorty.quote }
    unit_price { Faker::Number.decimal(l_digits: 2) }
    merchant_id { "" }
  end
end
