# Algorithm
    Before the challenge I'd never programmed in Ruby, to complete this challenge I've searched different web pages, videos and tutorials that helped me to understand Ruby on Rails and TDD with RSpec, thanks to that knowledge and information that I found, I implement the algorithm.
    It consists in a base conversion, there are 62 possible characters (digits 10 characters, lower case alphabet 26 characters and upper case alphabet 26 character) so the algorithm converts the ID that is a decimal number to a base 62 number.

# Intial Setup

    docker-compose build
    docker-compose up mariadb
    # Once mariadb says it's ready for connections, you can use ctrl + c to stop it
    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml build

# To run migrations

    docker-compose run short-app rails db:migrate
    docker-compose -f docker-compose-test.yml run short-app-rspec rails db:test:prepare

# To run the specs

    docker-compose -f docker-compose-test.yml run short-app-rspec

# Run the web server

    docker-compose up

# Adding a URL

    curl -X POST -d "full_url=https://google.com" http://localhost:3000/short_urls.json

# Getting the top 100

    curl localhost:3000

# Checking your short URL redirect

    curl -I localhost:3000/abc
