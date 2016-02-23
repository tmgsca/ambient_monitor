Role.create([{description: 'Admin'}, {description: 'Member'}])
User.create([{email: 'admin@admin.com', password: '123456', role_id: 1}])
Measure.create([{room_id: 1, temperature: 25.0, humidity: 10.0}, {room_id: 1, temperature: 25.0, humidity: 10.0}])
