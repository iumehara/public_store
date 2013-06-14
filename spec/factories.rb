FactoryGirl.define do

  factory :store do
    name { Faker::Company.name }
  end

  factory :staff do
    name { Faker::Name.name }
    email { "staff-#{n+1}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end

  factory :invitation do
    store_id { rand(Store.all.to_a.count) + 1 }
    staff_id { Staff.all[n].id }
    credential "private"
  end

  factory :line_item do
    food_origin { Faker::Address.city }
    food_base { ["lager", "ale", "wine", "cocktail", "spritzer", "pizza", "pasta", "sandwich", "wings", "roll"] }
    store_id { Store.all[rand(Store.all.to_a.count)].id }
    private_info { "private info #{rand(1000..9999)}" }
  end  
end