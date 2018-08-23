**This is an Email Panel**

This panel stores mailboxes, emails, employees details, user details etc
The admin and only assigned employees can reply to assigned emails.

**Procedure to run this app on local machine**
> `bundle install`

> install redis on your machine for running background jobs

> run `rails db:create`

> run `rails db:migrate`

> run `rake db:seed`to populate dummy admin and employee data

> run `bundle exec sidekiq` to start sidekiq to start background jobs

> run `rails s`

> you can also run tests for `FetchEmail` module with `rspec spec/unit/fetch_mail_test.rb `

> to access sidekiq go to 'localhost:3000/sidekiq'

**IMPORTANT NOTE**

you have to provide permissions to prevent gmail from blocking the access.
you can go to: 

> [Turn this on your gmail account](https://myaccount.google.com/lesssecureapps)

> [Also provide access through this](https://accounts.google.com/DisplayUnlockCaptcha )
