require 'faker'

10.times do 
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(8),
    role: ["standard","premium"].sample
  )
end
u = User.new( 
    :name => "D. Brian Porter",
    :email => "porter4487@gmail.com",
    :password => "port75904",
    :role => "admin"
)
u.save
users = User.all

50.times do
  Wiki.create!(
    title: Faker::Lorem.sentence(3),
    body: Faker::Lorem.paragraphs(5),
    private: [true,false].sample,
    user: users.sample
  )
end

puts "Seeding finished!"
puts "#{User.count} users created."
puts "#{Wiki.count} wikis created."