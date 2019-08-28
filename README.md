```sh
bundle install
bundle exec rackup # in one process
bundle exec rake resque:work QUEUE=fail_tests # in another process
bundle exec rake resque:scheduler # in another process

# in the browser, go to
# http://localhost:9292/overview

# now queue up some work and keep catting f1, you'll see it retry a bunch of times
bundle exec rake add FILENAME="$PWD/f1" COUNT=3
```
