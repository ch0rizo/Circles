puts "> Clearing the DB.."
CircleEvent.destroy_all

UserEvent.destroy_all
EventMessage.destroy_all

UserCircle.destroy_all
CircleMessage.destroy_all

Event.destroy_all
Circle.destroy_all
User.destroy_all

puts "> Creating the main character..."

main_user = User.create(email: 'benten@gmail.com', password: 'password', username: 'benten_', first_name: 'Ben', last_name: 'Ten')


puts "> Creating other random shit"
50.times do
  User.create(
    email: Faker::Internet.email,
    password: 'password',
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end

# Family circle
circle1 = Circle.create(
  name: 'Family',
  private: true
)
UserCircle.create(
  user_id: main_user.id,
  circle_id: circle1.id
)
4.times do
  UserCircle.create(
    user_id: User.all.sample.id,
    circle_id: circle1.id
  )
end


# Fotball circle
circle2 = Circle.create(
  name: 'MLC FC',
  private: true
)
UserCircle.create(
  user_id: main_user.id,
  circle_id: circle2.id
)
12.times do
  UserCircle.create(
    user_id: User.all.sample.id,
    circle_id: circle2.id
  )
end


# Work circle
circle3 = Circle.create(
  name: 'Work',
  private: false
)
UserCircle.create(
  user_id: main_user.id,
  circle_id: circle3.id
)
10.times do
  UserCircle.create(
    user_id: User.all.sample.id,
    circle_id: circle3.id
  )
end

circle4 = Circle.create(
  name: 'Rogue',
  private: false
)
4.times do
  UserCircle.create(
    user_id: User.all.sample.id,
    circle_id: circle1.id
  )
end

puts '> Finished!'
puts "> Made #{User.count} users, #{Circle.count} circles"

