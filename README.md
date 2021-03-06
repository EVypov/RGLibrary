# Rglibrary

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/rglibrary`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rglibrary'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rglibrary

## Usage

Begin using library by adding:
```require 'rglibrary``` 

###Create new library:

    lb = RGLibrary::Library.new

You can load library with JSON-formatted data:
```
lb.fill_with_initial_data(json_file_name)
```
Or fill content adding item-by-item:

    book = RGLibrary::Book.new("Gone Girl", "Gillian Flynn")
    order = RGLibrary::Order.new("All the President's Men", 'Jihn Palt')
    lb.add_book(book)
    lb.add_order(order)

###Saving/Loading

    lb.save_data
    lb.load_data
    
###Utils

    lb.top_readers #Show number of people who read most popular books
    lb.who_often_takes_the_book (book_name) #Show person who often takes the book
    
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

