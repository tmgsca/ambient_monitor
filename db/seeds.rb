Role.create([{description: 'Admin'}, {description: 'Member'}])

User.create([{email: 'admin@admin.com', password: '123456', name: 'Daniel Magalhães', role_id: 1}])

Room.create([{name: 'Noah Room', user_id: 1}])
