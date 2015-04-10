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

guest = User.create!(
  email: 'guest@test.com',
  username: 'Guest',
  password: 'password',
  description: 'Check out the intro blog post!'
)

u1 = User.create!(
  email: 'user1@test.com',
  username: 'TrailBro88',
  password: 'password1',
  description: 'I run trails and mountains, and race ultras.'
)
u1.blogs.create!(
  title: "Traveling for Races",
  body: "Source: [Trail Runner Magazine](http://www.trailrunnermag.com/training/trail-tips/1683-a-better-trip-makes-a-better-race)\r\n\r\n##
        Four trail-running pros share their race-travel tips\r\n\r\nWhen preparing for a goal
        race at a far-away destination, you do everything you can to maximize training. Then you
        rest and try to stay healthy during your taper. But what do you do when it’s time to travel
        to the big event? Ideally, you plan to make travel stress-free and you arrive 100-percent
        race ready. Surprisingly, however, many of us don’t sweat the details of travel in our race
        plans and encounter problems en route that can sabotage the physical conditioning and mental
        equanimity we worked so hard to achieve. Trail Runner asked four pros and experienced travellers
        for their advice on getting to the race in top shape.\r\n\r\n##Our panel of experts:\r\n\r\n*Ian
        Sharman, Walnut Creek, California.*\r\n\r\n2013 Grand Slam of Ultrarunning record holder and
        coach to other champions. Has raced in over 30 countries on six continents.\r\n\r\n*Amy Sproston,
        Bend, Oregon.*\r\n\r\n2012 100K World Championship winner, who in the past two years raced
        numerous ultras in South America, Europe and Asia. Her work for an international humanitarian
        group takes her around the globe.\r\n\r\n*Scott Dunlap, Woodside, California.*\r\n\r\n2010 USA
        Track & Field Master’s Ultrarunner of the Year, who in recent years raced throughout the United
        States and Europe. Dunlap flies weekly as an executive and investor for tech
        start-ups.\r\n\r\n*Stephanie Case, Vancouver, British Columbia.*\r\n\r\nPast winner of
        several 250K desert-crossing self-supported stage races and the Vermont 100.
        She travels frequently for her work for human-rights organizations, and was
        recently stationed in the South Sudan and now in
        Gaza.\r\n\r\n[Read More](http://www.trailrunnermag.com/training/trail-tips/1683-a-better-trip-makes-a-better-race)",
  preview: "Repost"
)
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
u2.blogs.create!(
  title: "Running Exercises",
  body: "I've found that these are the quickest/easiest exercises to do to supplement
        running with strength training. Even if you only do them a small amount it will
        help!\r\n\r\n* Planks\r\n* Lunges\r\n* Body-Weight Squats\r\n\r\nTry starting
        with a 1min regular plank, then 1min on each side, followed by 20-30 lunges and
        squats. Do this this 2-3 times a week, gradually increasing the duration of planks
        and number of lunges/squats when you get comfortable with the current level.",
  preview: "A few of my favorites."
)
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
    shoe_id: u2s2.id
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
u3.blogs.create!(
  title: "First Half Marathon",
  body: "I'm getting ready to do my first half! I've done a handful of 5Ks and
  10Ks and they all went really well. I've never ran longer than 8 miles before
  I'm excited to see what I can do beyond that. A few options I'm thinking
  about:\r\n\r\n* Queens Half\r\n* Brooklyn Half\r\n* Paine to Pain (trail!!)\r\n*
  Greenway Half\r\n* Long Island Half\r\n\r\nHas anyone done any of these?
  Which one would you pick as your first?",
  preview: "The next step."
)
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
