namespace :db do

# MODEL ATTRIBUTE
 
  desc "Fill database with sample stores"
  task stores: :environment do
    5.times do |n|
      name = Faker::Company.name
      Store.create!(name: name)
    end
  end

  desc "Fill database with sample staff"
  task staffs: :environment do
    30.times do |n|
      name          = Faker::Name.name
      email         = "staff-#{n+1}@example.com"
      password      = "foobar"
      Staff.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end

  desc "Fill database with sample invitations"
  task invitations: :environment do
    30.times do |n|
      store_id =  rand(Store.all.to_a.count) + 1
      staff_id =  Staff.all[n].id
      credential = "private"
      Invitation.create!(store_id: store_id,
                         staff_id: staff_id,
                         credential: credential)
    end
  end

  desc "Fill database with sample line items"
  task line_items: :environment do
    100.times do |n|
      food_origin   = Faker::Address.city
      food_base     = ["lager", "ale", "wine", "cocktail", "spritzer", "pizza", "pasta", "sandwich", "wings", "roll"]
      store_id      =  Store.all[rand(Store.all.to_a.count)].id
      private_info  = "private info #{rand(1000..9999)}"
      LineItem.create!(name: food_origin + " " + food_base[rand(9)],
                       private_info: private_info,
                       store_id: store_id)
    end
  end  
end
