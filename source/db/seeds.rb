require 'faker'

# create a few users

#TODO: Once you have implemented BCrypt - you can use these to seed your database.
@users= []

User.create :first_name => 'Matias', :email => 'me@example.com', :password_hash => 'password'
5.times do
  @users << User.create(:first_name => Faker::Name.first_name, last_name: Faker::Name.last_name, :email => Faker::Internet.email, :password_hash => 'password')
end

5.times do
	@users.sample.campgrounds.create( name: Faker::Name.name, state: Faker::Address.state)
end