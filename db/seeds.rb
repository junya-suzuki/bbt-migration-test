User.destroy_all

100.times do |i|
  User.create!(
    name: "name-#{i}",
    email: "example-#{i}@example.com"
  )
end
