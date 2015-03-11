def make_user1
  User.create!(email: 'user1@test.com',
                       username: 'user1',
                       password: 'password1',
                       description: 'I am the first test user.',
                       photo_url: 'http://warriorcatsrpg.com/awards/9130-mini.jpg?0'
  )
end

def make_user2
  User.create!(email: 'user2@test.com',
                         username: 'user2',
                         password: 'password2',
                         description: 'I am the second test user.',
                         photo_url: 'http://gainweighthow.com/wp-content/uploads/2013/05/How-to-Add-Weight-to-a-Cat.jpg'
    )
end

def sign_in(username, password)
  visit new_sessions_url

  within(".sign-in") do
    fill_in 'user[login]', with: username
    fill_in 'user[password]', with: password
  end

  click_on "Sign In"
end
