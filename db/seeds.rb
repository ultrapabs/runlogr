User.destroy_all
Blog.destroy_all

user1 = User.create!(email: 'user1@test.com',
                     username: 'user1',
                     password: 'password1',
                     description: 'I am the first test user.',
                     photo_url: 'http://warriorcatsrpg.com/awards/9130-mini.jpg?0'
)

user2 = User.create!(email: 'user2@test.com',
                     username: 'user2',
                     password: 'password2',
                     description: 'I am the second test user.',
                     photo_url: 'http://gainweighthow.com/wp-content/uploads/2013/05/How-to-Add-Weight-to-a-Cat.jpg'
)

blog1 = user1.blogs.create!(title: "Blog Post 1",
                            body: "This is the body of post 1.",
                            preview: "This is the preview of post 1."
)

blog2 = user1.blogs.create!(title: "Blog Post 2",
                            body: "This is the body of post 2.",
                            preview: "This is the preview of post 2."
)

blog3 = user2.blogs.create!(title: "Blog Post 3",
                            body: "This is the body of post 3.",
                            preview: "This is the preview of post 3."
)
