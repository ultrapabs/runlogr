User.destroy_all
Blog.destroy_all
Log.destroy_all
Shoe.destroy_all

user1 = User.create!(
  email: 'user1@test.com',
  username: 'TrailBro',
  password: 'password1',
  description: 'I run trails and mountains, and race ultras.'
)
user2 = User.create!(
  email: 'user2@test.com',
  username: 'RoadRunner77',
  password: 'password2',
  description: 'I run fast road races up to the marathon distance.'
)
user3 = User.create!(
  email: 'user3@test.com',
  username: 'mountainman',
  password: 'password3',
  description: 'I like hiking and running trails.'
)

blog1 = user1.blogs.create!(
  title: "Hills",
  body: "Hill repeats, long hills, slow hills, steep hills, etc.",
  preview: "I love hills."
)
blog2 = user1.blogs.create!(
  title: "Trails",
  body: "Real runners run trails. If you're not muddy after a run then what's the point?",
  preview: "Trail running is the best."
)
blog3 = user2.blogs.create!(
  title: "Road Running",
  body: "I love flat roads. Trails and hills are dumb. Road racing is where the action is.",
  preview: "I heart asphalt."
)

shoe1 = user1.shoes.create!(
  name: "NB980v1 Black/Green",
  distance: 0
)
shoe2 = user1.shoes.create!(
  name: "NB Zante NYC",
  distance: 0
)
shoe3 = user1.shoes.create!(
  name: "Asics Fuji Racer",
  distance: 0,
)
shoe4 = user2.shoes.create!(
  name: "Hoka Conquest Blue",
  distance: 0
)
shoe5 = user3.shoes.create!(
  name: "Inov8 TrailRoc 235",
  distance: 0
)

log1 = user1.logs.create!(
  title: "Tempo Run",
  date: Date.new(2014, 8, 4),
  distance: 12.2,
  duration: (12.2 * 6.5 * 60),
  notes: "Humidity sucks.",
  shoe_id: shoe2.id
)
log2 = user1.logs.create!(
  title: "Long Run",
  date: Date.new(2014, 8, 6),
  distance: 21.2,
  duration: (21.2 * 6.5 * 60),
  notes: "Crushed it.",
  shoe_id: shoe1.id
)
log3 = user1.logs.create!(
  title: "Hill Repeats",
  date: Date.new(2014, 8, 8),
  distance: 7,
  duration: (7 * 7.2 * 60),
  notes: "warmup ~2mi, 12x400m hills, cooldown ~2mi",
  shoe_id: shoe3.id
)
log4 = user1.logs.create!(
  title: "Long Trail Run",
  date: Date.new(2014, 8, 10),
  distance: 27,
  duration: (27 * 8.7 * 60),
  notes: "Bear Mountain is awesome.",
  shoe_id: shoe3.id
)
log5 = user2.logs.create!(title: "Easy Run",
  date: Date.new(2014, 8, 4),
  distance: 6.3,
  duration: (6.3 * 7.5 * 60),
  notes: "Central Park was crowded.",
  shoe_id: shoe4.id
)
log6 = user2.logs.create!(
  title: "Long Run",
  date: Date.new(2014, 8, 6),
  distance: 17.3,
  duration: (17.3 * 8.2 * 60),
  notes: "All the bridges!",
  shoe_id: shoe4.id
)
log7 = user2.logs.create!(
  title: "Fartlek",
  date: Date.new(2014, 8, 8),
  distance: 10.3,
  duration: (73 * 60),
  notes: "8x 3min on / 2min off, avg on pace: 5:42, off: 7:50, 4ish miles of warmup/cooldown",
  shoe_id: shoe4.id
)
log8 = user2.logs.create!(
  title: "Easy Run",
  date: Date.new(2014, 8, 10),
  distance: 4.5,
  duration: (4.5 * 7.4 * 60),
  notes: "Prospect Park is great!",
  shoe_id: shoe4.id
)

log9 = user3.logs.create!(
  title: "Tempo",
  date: Date.new(2014, 8, 4),
  distance: 9.1,
  duration: (9.1 * 5.4 * 60),
  shoe_id: shoe5.id
)
log10 = user3.logs.create!(
  title: "Long Run",
  date: Date.new(2014, 8, 6),
  distance: 14.3,
  duration: (14.3 * 7.6 * 60),
  shoe_id: shoe5.id
)
log11 = user3.logs.create!(
  title: "Alps",
  date: Date.new(2014, 8, 8),
  distance: 22,
  duration: (22 * 9.3 * 60),
  notes: "Snowy and cold.",
  shoe_id: shoe5.id
)
log12 = user3.logs.create!(
  date: Date.new(2014, 8, 10),
  distance: 6.2,
  duration: (6 * 7.4 * 60),
)
