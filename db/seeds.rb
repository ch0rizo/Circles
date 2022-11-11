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
user_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668172413/development/julian-wan-WNoLnJo7tS8-unsplash_svo56p.jpg"
user_file = URI.open(user_url)
main_user.photo.attach(io: user_file, filename: 'circle_img.png', content_type: 'image/png')


puts "> Creating other random shit"

30.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'password',
    username: Faker::Internet.username,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  user.save
  user_url = "http://s3.amazonaws.com/37assets/svn/765-default-avatar.png"
  user_file = URI.open(user_url)
  user.photo.attach(io: user_file, filename: 'circle_img.png', content_type: 'image/png')
end

# Family circle
circle1 = Circle.create(
  name: 'Family',
  private: true
)
# group image
circle1_url = "https://images.unsplash.com/photo-1655185497013-db98aca061d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
circle1_file = URI.open(circle1_url)
circle1.photo.attach(io: circle1_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
circle_banner1_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668164718/development/hoi-an-photographer-DyhiB_wFifk-unsplash_1_iihjlz.jpg"
circle_banner1_file = URI.open(circle_banner1_url)
circle1.banner.attach(io: circle_banner1_file, filename: 'circle_img.png', content_type: 'image/png')


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

# Basketball circle
circle2 = Circle.create(
  name: 'Miami Bulls',
  private: true
)

# group image
circle2_url = "https://images.unsplash.com/photo-1515523110800-9415d13b84a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
circle2_file = URI.open(circle2_url)
circle2.photo.attach(io: circle2_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
circle_banner2_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668169251/development/kenny-eliason-O4zhy0zLAQc-unsplash_zrv34h.jpg"
circle_banner2_file = URI.open(circle_banner2_url)
circle2.banner.attach(io: circle_banner2_file, filename: 'circle_img.png', content_type: 'image/png')

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
  name: 'Circle - Startup',
  private: false
)

# group image
circle3_url = "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80"
circle3_file = URI.open(circle3_url)
circle3.photo.attach(io: circle3_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
circle_banner3_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668169345/development/javier-allegue-barros-i5Kx0P8A0d4-unsplash_vegqst.jpg"
circle_banner3_file = URI.open(circle_banner3_url)
circle3.banner.attach(io: circle_banner3_file, filename: 'circle_img.png', content_type: 'image/png')

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

puts '> Finished!'
puts "> Made #{User.count} users, #{Circle.count} circles"

