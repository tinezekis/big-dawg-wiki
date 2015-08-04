User.destroy_all if User.any?

bd = User.create!(username: 'bigdawg', password: 'password', permission_level: 'big_dawg')
u1 = User.create!(username: 'user1', password: 'password', permission_level: 'author')
u2 = User.create!(username: 'user2', password: 'password', permission_level: 'author')

10.times do
  User.create!(username: Faker::Name.name,
                password: Faker::Internet.password(6),
                permission_level: 'author')
end
