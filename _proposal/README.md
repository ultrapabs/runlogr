# Run(b)logr

[Heroku link][heroku]

INSERT HEROKU LINK

## Minimum Viable Product
Run(b)logr is a clone of [Flotrackr][flotrack] built on Rails and Backbone with social and blogging components added. Users can:

[flotrack]: http://www.flotrack.org/page/Flotrackr

- [ ] Create accounts
- [ ] Create sessions (log in)
- [ ] Create blogs, running logs, and comments
- [ ] Import/export running log data to CSV
- [ ] Add shoes to logs, track mileage on shoes
- [ ] View blogs, running logs, and comments
- [ ] Follow/unfollow other users
- [ ] View a feed of followed users and their blogs/logs
- [ ] Search for users by username

## Design Docs
* [Wireframes][views]
* [DB schema][schema]

[views]: ./docs/views.md
[schema]: ./docs/schema.md

## Implementation Timeline

### Phase 1: User Authentication, Blog, Log, Shoe Creation (~1 day)

Add user sign up and sign in. Then, add initial blog, log, and shoe model creation. At the end of the day a user will be able to sign up and create each of the different features.

### Phase 2: Viewing Blogs and Logs, Commenting (~2 days)

Create  views of all the different parts of a user's account. Add commenting feature to both logs and blogs, with ability to edit/delete comments.

### Phase 3: User Profile View (~1 day)

Create view that other users will see, as well as editing capabilities if you view your own profile. User will see a feed of the user's blogs and logs.

### Phase 4: Searching for Users, Following/Unfollowing (~1 day)

Add user search so that users can find and follow/unfollow users of their choosing. Add follow/unfollow buttons to user view.

### Phase 5: Feed / Index View (~2 days)

Create landing page after sign in. User will see a feed of blogs and logs of the users they follow.

### Phase 6: Refine Views

Clean and homogenize all views of blogs, logs, feeds, and comments. Refine heaeder/footer.


### Bonus Features (TBD)
- [ ] Users create custom running maps/routes
- [ ] Blog, log, and route tags
- [ ] Blog, log, comment, and route "likes"
- [ ] Manipulate log data into different views/charts
- [ ] Log type classification and sorting (race, workout, training run)
- [ ] ???
