# Stadiumgoods Assignment

Welcome to the Stadiumgoods assignment. This repository includes a very basic rails app to be used to assessment and testing purposes only.

## Getting Started

Dependencies:

- Ruby 2.7.0
- Rails 6.0.3 (Framework)

Additional Gems:

- gem `rest-client`
- gem `concurrent-ruby`

Install bundle to install dependancies and gems.

- bundle install

Run this application

- rails server


## Challenge

### ☐ Return JSON response for different social platforms
We are returning JSON response for given social pages. 
- We are using `Rails.cache.write` and `Rails.cache.read` to write/read response because we might not receive any response in specific cases.
- We are using `concurrent-ruby` gem to call all three social pages parallelly.
