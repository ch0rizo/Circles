puts "> Clearing the DB.."

EventPlaylist.destroy_all
CircleEvent.destroy_all

UserEvent.destroy_all
EventMessage.destroy_all

UserCircle.destroy_all
CircleMessage.destroy_all

Event.destroy_all
Circle.destroy_all
User.destroy_all

puts "> Creating the main character..."

main_user = User.create(email: 'benten@gmail.com', password: 'password', username: 'benten', first_name: 'Ben', last_name: 'Lee')
user_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668172413/development/julian-wan-WNoLnJo7tS8-unsplash_svo56p.jpg"
user_file = URI.open(user_url)
main_user.photo.attach(io: user_file, filename: 'circle_img.png', content_type: 'image/png')

puts "> Creating male users"

30.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'password',
    username: Faker::Internet.username,
    first_name: Faker::Name.male_first_name,
    last_name: Faker::Name.last_name
  )
  user.save
  male_user_avatar_url = "https://xsgames.co/randomusers/avatar.php?g=male"
  male_user_avatar_file = URI.open(male_user_avatar_url)
  user.photo.attach(io: male_user_avatar_file, filename: 'user_avatar.png', content_type: 'image/png')
end

puts "> Creating female users"

30.times do
  user = User.new(
    email: Faker::Internet.email,
    password: 'password',
    username: Faker::Internet.username,
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name
  )
  user.save
  female_user_avatar_url = "https://xsgames.co/randomusers/avatar.php?g=female"
  female_user_avatar_file = URI.open(female_user_avatar_url)
  user.photo.attach(io: female_user_avatar_file, filename: 'user_avatar.png', content_type: 'image/png')
end

puts "> Creating some circles"

# Family circle
family_circle = Circle.create(
  name: 'Family 🧡',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)
# group image
family_circle_url = "https://images.unsplash.com/photo-1655185497013-db98aca061d3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
family_circle_file = URI.open(family_circle_url)
family_circle.photo.attach(io: family_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
family_banner_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668164718/development/hoi-an-photographer-DyhiB_wFifk-unsplash_1_iihjlz.jpg"
family_banner_file = URI.open(family_banner_url)
family_circle.banner.attach(io: family_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: family_circle
)
4.times do
  UserCircle.create(
    user: User.all.sample,
    circle: family_circle
  )
end

CirclePlaylist.create(
  url: "https://open.spotify.com/playlist/6FXSKFnt0PBo4W4itkLiSs?si=d1a25c33e4eb4f1b",
  circle: family_circle
)

CirclePlaylist.create(
  url: "https://open.spotify.com/playlist/5pETvbqkSwgr6QDJdfkbvz?si=6d4d3139a77647e0",
  circle: family_circle
)

CirclePlaylist.create(
  url: "https://open.spotify.com/playlist/37i9dQZF1DWTJ0ewkTmTo2?si=397cccbd6adc4bc2",
  circle: family_circle
)

# Basketball circle
basketball_circle = Circle.create(
  name: 'Miami Bulls 🏀',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)

# group image
basketball_circle_url = "https://images.unsplash.com/photo-1515523110800-9415d13b84a8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
basketball_circle_file = URI.open(basketball_circle_url)
basketball_circle.photo.attach(io: basketball_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
basketball_banner_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668169251/development/kenny-eliason-O4zhy0zLAQc-unsplash_zrv34h.jpg"
basketball_banner_file = URI.open(basketball_banner_url)
basketball_circle.banner.attach(io: basketball_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: basketball_circle
)
12.times do
  UserCircle.create(
    user: User.all.sample,
    circle: basketball_circle
  )
end

# Work circle
work_circle = Circle.create(
  name: 'The Office 💻',
  private: false,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)

# group image
work_circle_url = "https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1742&q=80"
work_circle_file = URI.open(work_circle_url)
work_circle.photo.attach(io: work_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
work_banner_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668169345/development/javier-allegue-barros-i5Kx0P8A0d4-unsplash_vegqst.jpg"
work_banner_file = URI.open(work_banner_url)
work_circle.banner.attach(io: work_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: work_circle
)
10.times do
  UserCircle.create(
    user: User.all.sample,
    circle: work_circle
  )
end

# Friends Circle
friends_circle = Circle.create(
  name: 'The Day Ones 💯',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)
# group image
friends_circle_url = "https://res.cloudinary.com/dhyxfzmqi/image/upload/v1668250710/development/simi-iluyomade-tvbxqXI5mmo-unsplash_wsd9mc.jpg"
friends_circle_file = URI.open(friends_circle_url)
friends_circle.photo.attach(io: friends_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
friends_banner_url = "https://images.unsplash.com/photo-1475483768296-6163e08872a1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
friends_banner_file = URI.open(friends_banner_url)
friends_circle.banner.attach(io: friends_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: friends_circle
)
6.times do
  UserCircle.create(
    user: User.all.sample,
    circle: friends_circle
  )
end

# Le Wagon Circle
wagon_circle = Circle.create(
  name: 'Le Wagon Crew 🤓',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)
# group image
wagon_circle_url = "https://www.smartshanghai.com/uploads/repository/2022/04/18/4bdf9551-4d55-49dd-b37e-1b2b3fc63231.png"
wagon_circle_file = URI.open(wagon_circle_url)
wagon_circle.photo.attach(io: wagon_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
wagon_banner_url = "https://images.unsplash.com/photo-1521737604893-d14cc237f11d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1184&q=80"
wagon_banner_file = URI.open(wagon_banner_url)
wagon_circle.banner.attach(io: wagon_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: wagon_circle
)
14.times do
  UserCircle.create(
    user: User.all.sample,
    circle: wagon_circle
  )
end

# Chess Club Circle
chess_circle = Circle.create(
  name: 'Chess Club ♟️',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)
# group image
chess_circle_url = "https://images.unsplash.com/photo-1529699310859-b163e33e4556?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=605&q=80"
chess_circle_file = URI.open(chess_circle_url)
chess_circle.photo.attach(io: chess_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
chess_banner_url = "https://images.unsplash.com/photo-1528819622765-d6bcf132f793?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
chess_banner_file = URI.open(chess_banner_url)
chess_circle.banner.attach(io: chess_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: chess_circle
)
7.times do
  UserCircle.create(
    user: User.all.sample,
    circle: chess_circle
  )
end

# Chess Club Circle
footy_circle = Circle.create(
  name: 'Footy Lads 🍻',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)
# group image
footy_circle_url = "https://aflnz.co.nz/wp-content/uploads/2017/08/One-team-many-cultures-feature.jpg"
footy_circle_file = URI.open(footy_circle_url)
footy_circle.photo.attach(io: footy_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
footy_banner_url = "https://live-production.wcms.abc-cdn.net.au/bd3ab61625858835228fb658c133c1cc?src"
footy_banner_file = URI.open(footy_banner_url)
footy_circle.banner.attach(io: footy_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: footy_circle
)
18.times do
  UserCircle.create(
    user: User.all.sample,
    circle: footy_circle
  )
end

# Chess Club Circle
ravers_circle = Circle.create(
  name: 'World Class Ravers',
  private: true,
  border_color: %w[#33a8c7 #52e3e1 #a0e426 #fdf148 #ffab00 #f77976 #f050ae #d883ff #9336fd #ffbe0b #fb5607 #ff006e #8338ec #3a86ff].sample
)
# group image
ravers_circle_url = "https://images.unsplash.com/photo-1637561930888-dfedf87bf609?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1167&q=80"
ravers_circle_file = URI.open(ravers_circle_url)
ravers_circle.photo.attach(io: ravers_circle_file, filename: 'circle_img.png', content_type: 'image/png')

# banner image
ravers_banner_url = "https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
ravers_banner_file = URI.open(ravers_banner_url)
ravers_circle.banner.attach(io: ravers_banner_file, filename: 'circle_img.png', content_type: 'image/png')

UserCircle.create(
  user: main_user,
  circle: ravers_circle
)
9.times do
  UserCircle.create(
    user: User.all.sample,
    circle: ravers_circle
  )
end

puts "> Creating some events..."

surf_trip = Event.create(
  title: "Surf Trip",
  private: true,
  location: "Gnaraloo",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

surf_trip_url = "https://images.unsplash.com/photo-1526342122811-2a9c8512023d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
surf_trip_file = URI.open(surf_trip_url)
surf_trip.photos.attach(io: surf_trip_file, filename: 'event_img.png', content_type: 'image/png')

nico_party = Event.create(
  title: "Nico's Sweet 20th",
  private: true,
  location: "Hamburg",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

nico_party_url = "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
nico_party_file = URI.open(nico_party_url)
nico_party.photos.attach(io: nico_party_file, filename: 'event_img.png', content_type: 'image/png')

poker_night = Event.create(
  title: "Poker Night",
  private: true,
  location: "Las Vegas",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

poker_night_url = "https://images.unsplash.com/photo-1609769322709-2de28ae6503a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80"
poker_night_file = URI.open(poker_night_url)
poker_night.photos.attach(io: poker_night_file, filename: 'event_img.png', content_type: 'image/png')

pangea = Event.create(
  title: "Pangea Festival",
  private: false,
  location: "Cederburg Wilderness Area",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

pangea_url = "https://www.tribeofpangea.com/wp-content/uploads/2020/07/webonly_PANGEA_0104_800.jpg"
pangea_file = URI.open(pangea_url)
pangea.photos.attach(io: pangea_file, filename: 'event_img.png', content_type: 'image/png')

footy = Event.create(
  title: "5-a-Side Football",
  private: true,
  location: "Rhodes High School",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

footy_url = "https://images.unsplash.com/photo-1544698310-74ea9d1c8258?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80"
footy_file = URI.open(footy_url)
footy.photos.attach(io: footy_file, filename: 'event_img.png', content_type: 'image/png')

christmas = Event.create(
  title: "Christmas",
  private: true,
  location: "South Pole",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

christmas_url = "https://images.unsplash.com/photo-1543094754-0790f4838e00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
christmas_file = URI.open(christmas_url)
christmas.photos.attach(io: christmas_file, filename: 'event_img.png', content_type: 'image/png')

ozcf = Event.create(
  title: "OZCF Market",
  private: false,
  location: "V&A Waterfront",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

ozcf_url = "https://images.unsplash.com/photo-1533900298318-6b8da08a523e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
ozcf_file = URI.open(ozcf_url)
ozcf.photos.attach(io: ozcf_file, filename: 'event_img.png', content_type: 'image/png')

braai = Event.create(
  title: "Braai & Watch Bokke",
  private: true,
  location: "Constantia",
  user: User.all.sample,
  start_date: Faker::Date.between(from: '2022-11-1', to: '2022-11-30'),
  end_date: Faker::Date.between(from: '2022-11-30', to: '2023-01-30')
)

braai_url = "https://www.sapeople.com/wp-content/uploads/2022/11/france-win-221112-kurt-lee-arendse-springboks.jpeg"
braai_file = URI.open(braai_url)
braai.photos.attach(io: braai_file, filename: 'event_img.png', content_type: 'image/png')

puts '> Finished!'
puts "> Made #{User.count} users, #{Circle.count} circles and #{Event.count} events!"
