User.destroy_all if User.any?
u1 = User.create!(username: 'user1', password: 'password', permission_level: 'author')
u2 = User.create!(username: 'user2', password: 'password', permission_level: 'author')

