namespace :dev do 
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    50.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "Created #{Restaurant.count} fake restaurants data"
  end

  task fake_user: :environment do
    10.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        name: "#{user_name}",
        email: "#{user_name}@example.com",
        password: "123456"
      )
    end
    puts "Created #{User.count} fake user data"
  end

  task fake_comment: :environment do
    Restaurant.all.each do |restaurant|
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        ) 
      end   
    end  
    puts "Created #{Comment.count} fake comment data"
  end

end  