# Fonix chat

#### Tested with:

```
ruby 3.0.3
rails 7.0.2.3
nodejs 17.6.0
postgres 12.2
redis 6.0.9
```

#### Setup:

run `bin/setup`

#### Test

run `bin/rspec`

#### Run app:

run `bin/dev`

visit: http://127.0.0.1:3000/

login: admin@admin.com

password: admin1

#### Note

Due to some issues with devise and rails 7 turbo that does not play well with RactDom might be necessary refresh the browser after landing in the chat page upon the login.

