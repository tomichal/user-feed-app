# README

This is a demo web app where users can create and follow feeds. 
It is written on Ruby on Rails (Ruby 2.3.1 and Rails 5). 
 
## How to get the app running.

1. Pull code to your machine:<br/>
`git clone https://github.com/tomichal/user-feed-app.git`<br/>
and change into its directory:<br/>
`cd user-feed-app`

2. Install dependencies:
- Make sure you have installed Ruby 2.3.1, RubyGems, redis, PostgreSQL.
- Install bundler gem if not already available:<br/> `gem install bundler`
- Install all of the application dependencies:<br/> `bundle`   

3. Setup database.<br/>
- The application uses PostgreSQL, so make sure postgres is running on your machine.
- Run:<br/> `bundle exec rake db:create db:schema:load db:seed`<br/>
  The `db:seed` rake command populates the database with some sample data.
  In `db/seeds.rb` you can see what users are created.
  All of them have simple two-letter usernames and "pass" password for easy log in.

4. Start the app up. 
- Start your redis server if it's not already running (it should be started on port 6379, which should be its default port anyway).
- Start delayed job: `bin/delayed_job start`.
- Start the application server: `rails server`. This will start the default Rails 5 development server (puma).

Now go to http://localhost:3000 and you should see the home page showing a public posts feed.

## Additional info
### Why redis, and delayed_job?
I wanted to utilise the ActionCable feature of Rails 5.
Redis seemed better in the development mode than the default Rails's async adapter, because it can pass ActionCable messages between multiple browser windows and that did not seem to work with the defaul async ActionCable adapter.
Try this:
1. Log in as user "jd" in one browser window.
2. Open another browser window using either a different browser user profile, or a different browser (so that e.g. one window runs in Chrome and another in Firefox).
3. Log in as user "cp" in the other browser window.
4. Create a post as the user "cp"
5. After a second or so the post should pop up on the jd's profile (since he follows cp).
6. You can also go to the public feed in the first browser window and toggle the public/private feed setting of the user in the second window. This will pop up an alert message in the first window.

Please note that in order for the above steps to work delayed_job and redis (on port 6379) have to be running.

### Running tests.
There are a few tests written in RSpec and they can be run with:<br/>
`bundle exec rspec`

### Why are secrets commited in the repository.
This is a demo app, not running in production, so secrets (passwords, Rails master key, etc) are commited so that it's easier to get the app running from scratch.

### Why not using HTTPS.
This is a demo app so running the app over HTTPS (for e.g.: safe password transmissions upon user logging in) is not neccessary and would make getting the app running from scratch harder.

## Questions? Issues getting it running?
The app should be running without issues, per the given specification (with few additions like the ActionCable features), so if something is not working please let me know :)