User.destroy_all
Blog.destroy_all
Log.destroy_all
Shoe.destroy_all

def rand_dist(min, max)
  rand(min.to_f..max.to_f).round(1)
end

def rand_pace(min_pace, max_pace)
  rand_dist(min_pace, max_pace)
end

def rand_days(max_days, min_freq, max_freq)
  days = []
  day = rand(min_freq..max_freq)
  while day <= max_days
    days << day
    day += rand(min_freq..max_freq)
  end
  days
end

def get_title_notes(dist, d_min, d_max, pace, p_min, p_max)
  d_effort = (dist - d_min.to_f) / (d_max - d_min)
  p_effort = (pace - p_min.to_f) / (p_max - p_min)

  title = 'untitled'
  notes = ''

  if d_effort < 0.2
    title = 'Recovery Run'
  elsif d_effort >= 0.2 && d_effort < 0.4
    title = 'Easy Run'
  elsif d_effort > 0.7
    title = 'Long Run'
  end

  if p_effort < 0.2 && d_effort < 0.2
    notes = 'Legs felt heavy, need to rest more.'
  elsif p_effort > 0.8 && d_effort > 0.5 && d_effort < 0.7
    notes = 'Tempo run, felt great!'
  elsif p_effort > 0.8 && d_effort > 0.8
    notes = 'Crushed it!'
  elsif p_effort < 0.2 && d_effort > 0.8
    notes = 'Felt terrible, probably needed to eat more for breakfast.'
  elsif p_effort > 0.5 && d_effort > 0.8
    notes = 'Pace felt okay, could have picked it up a bit.'
  elsif p_effort > 0.7 && d_effort < 0.2
    notes = 'Too fast, whoops.'
  elsif p_effort > 0.4 && d_effort > 0.4
    notes = 'Felt easy.'
  end

  [title, notes]
end

def notes_flavor(day)
  if [1,6,18,27].include?(day)
    ' Rainy.'
  elsif [2,5,20,26].include?(day)
    ' Cold.'
  elsif [3,15,24,30].include?(day)
    ' Cloudy.'
  elsif [11,14,21,29].include?(day)
    ' Sunny.'
  else
    ''
  end
end

u1 = User.create!(
  email: 'user1@test.com',
  username: 'TrailBro88',
  password: 'password1',
  description: 'I run trails and mountains, and race ultras.'
)
# u1.blogs.create!(
#   title: "",
#   body: "",
#   preview: ""
# )
u1s1 = u1.shoes.create!(
  name: "Hoka Huaka (grey)",
  distance: 0
)
u1s2 = u1.shoes.create!(
  name: "Hoka Huaka (blue)",
  distance: 0
)

jan1 = rand_days(31, 1, 2)
feb1 = rand_days(28, 2, 3)
mar1 = rand_days(31, 1, 2)
apr1 = rand_days(9, 1, 2)

jan1.each do |day|
  distance = rand_dist(4, 20)
  pace = rand_pace(6.5, 8)
  title_notes = get_title_notes(distance, 4, 20, pace, 6.5, 8)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u1.logs.create!(
    title: title,
    date: Date.new(2015, 1, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u1s1.id
  )
end
feb1.each do |day|
  distance = rand_dist(6, 14)
  pace = rand_pace(7, 8.5)
  title_notes = get_title_notes(distance, 6, 14, pace, 7, 8.5)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u1.logs.create!(
    title: title,
    date: Date.new(2015, 2, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u1s1.id
  )
end
mar1.each do |day|
  distance = rand_dist(8, 22)
  pace = rand_pace(6.5, 7.8)
  title_notes = get_title_notes(distance, 8, 22, pace, 6.5, 7.8)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u1.logs.create!(
    title: title,
    date: Date.new(2015, 3, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u1s2.id
  )
end
apr1.each do |day|
  distance = rand_dist(10, 24)
  pace = rand_pace(6.3, 8)
  title_notes = get_title_notes(distance, 10, 24, pace, 6.3, 8)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u1.logs.create!(
    title: title,
    date: Date.new(2015, 4, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u1s2.id
  )
end


u2 = User.create!(
  email: 'user2@test.com',
  username: 'RoadRunner82',
  password: 'password2',
  description: 'I run fast road races up to the marathon distance.'
)
# u2.blogs.create!(
#   title: "",
#   body: "",
#   preview: ""
# )
u2s1 = u2.shoes.create!(
  name: "NB980v1 (orange)",
  distance: 0
)
u2s2 = u2.shoes.create!(
  name: "NB980v2 (green)",
  distance: 0
)
jan2 = rand_days(31, 1, 2)
feb2 = rand_days(28, 1, 2)
mar2 = rand_days(31, 1, 1)
apr2 = rand_days(9, 2, 3)

jan2.each do |day|
  distance = rand_dist(4, 12)
  pace = rand_pace(6.3, 7.5)
  title_notes = get_title_notes(distance, 4, 12, pace, 6.3, 7.5)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u2.logs.create!(
    title: title,
    date: Date.new(2015, 1, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u2s1.id
  )
end
feb2.each do |day|
  distance = rand_dist(6, 16)
  pace = rand_pace(6.5, 8)
  title_notes = get_title_notes(distance, 6, 16, pace, 6.5, 8)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u2.logs.create!(
    title: title,
    date: Date.new(2015, 2, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u2s1.id
  )
end
mar2.each do |day|
  distance = rand_dist(8, 12)
  pace = rand_pace(5.8, 7.4)
  title_notes = get_title_notes(distance, 8, 12, pace, 5.8, 7.4)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u2.logs.create!(
    title: title,
    date: Date.new(2015, 3, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u2s1.id
  )
end
apr2.each do |day|
  distance = rand_dist(6, 10)
  pace = rand_pace(7.2, 8.2)
  title_notes = get_title_notes(distance, 6, 10, pace, 7.2, 8.2)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u2.logs.create!(
    title: title,
    date: Date.new(2015, 4, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u2s2.id
  )
end

u3 = User.create!(
  email: 'user3@test.com',
  username: 'FunRunner85',
  password: 'password3',
  description: 'I love running with friends and doing fun runs.'
)
# u3.blogs.create!(
#   title: "",
#   body: "",
#   preview: ""
# )
u3s1 = u3.shoes.create!(
  name: "Nike Trainers",
  distance: 167
)

jan3 = rand_days(31, 5, 6)
feb3 = rand_days(28, 5, 8)
mar3 = rand_days(31, 5, 5)
apr3 = rand_days(9, 6, 7)

jan3.each do |day|
  distance = rand_dist(4, 6)
  pace = rand_pace(10, 12)
  title_notes = get_title_notes(distance, 4, 6, pace, 10, 12)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u3.logs.create!(
    title: title,
    date: Date.new(2015, 1, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u3s1.id
  )
end
feb3.each do |day|
  distance = rand_dist(4, 7)
  pace = rand_pace(10, 13)
  title_notes = get_title_notes(distance, 4, 7, pace, 10, 13)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u3.logs.create!(
    title: title,
    date: Date.new(2015, 2, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u3s1.id
  )
end
mar3.each do |day|
  distance = rand_dist(3, 5)
  pace = rand_pace(9.5, 10.5)
  title_notes = get_title_notes(distance, 3, 5, pace, 9.5, 10.5)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u3.logs.create!(
    title: title,
    date: Date.new(2015, 3, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u3s1.id
  )
end
apr3.each do |day|
  distance = rand_dist(3, 8)
  pace = rand_pace(9, 12)
  title_notes = get_title_notes(distance, 3, 8, pace, 9, 12)
  title, notes = title_notes[0], title_notes[1]
  notes += notes_flavor(day)

  u3.logs.create!(
    title: title,
    date: Date.new(2015, 4, day),
    distance: distance,
    duration: pace * 60 * distance,
    notes: notes,
    shoe_id: u3s1.id
  )
end
