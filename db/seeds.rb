Role.create([{description: 'Admin'}, {description: 'Member'}])

User.create([{email: 'admin@admin.com', password: '123456', name: 'Daniel Magalhães', role_id: 1}])

Room.create([{name: 'Noah Room', user_id: 1}])

Measure.create([
  {room_id: 1, temperature: 25.0, humidity: 10.0, created_at: 1.day.ago},
  {room_id: 1, temperature: 50.0, humidity: 20.0, created_at: 1.day.ago}])
