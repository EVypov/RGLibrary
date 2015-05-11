require "rglibrary/version"
require 'rglibrary/reader'
require 'rglibrary/author'
require 'rglibrary/book'
require 'rglibrary/order'
require 'json'
require 'yaml'


module RGLibrary
   class Library

    TOP_3 = 3
    LIB_DATA_DUMP = 'lib_data.yml'

    attr_accessor :authors, :readers, :books, :orders

    def initialize
    	@authors = []
    	@readers = []
    	@books = []
    	@orders = []
    end

    def fill_with_initial_data(data_file)
      data = JSON.parse(File.read(data_file))

      data["authors"].each do |author|
    	  @authors << Author.new(author["name"], author["bio"])
      end

      data["books"].each do |book|
    	  author = authors.find{|author| author.name == book["author"]}
    	  @books << Book.new(book["title"], author)
      end

    	data["readers"].each do |reader|
    		@readers << Reader.new(reader["name"], reader["email"], reader["city"], reader["street"], reader["house"])
    	end
    end

    def add_book(book)  
      author = @authors.find{|author| author.name == book.author}
      @books << book if author
    end

    def add_reader(reader)  
      @readers << reader
    end

    def add_author(author)
      @author << author
    end

    def add_order(order)
      book = @books.find {|book| book.title == order.book}
      reader = @readers.find {|reader| reader.name == order.reader}
      raise "We don't have the book in our library" if book == nil
      raise "Unregistered reader" if reader == nil
      @orders << order if book && reader
      book.take_the_book
      reader.make_an_order(book)
    end  

    def top_books
      books_sorted = @books.sort {|a,b| b.times_taken <=> a.times_taken}
  	  result = books_sorted[0...TOP_3]
    end

    def top_readers

      books = top_books
      readers_with_orders = [] 
      result = []
      
      @readers.each do |reader| 
  	    readers_with_orders << reader if reader.orders.length != 0
      end

      books.each do |book|
        book_title = book.title
        readers_with_orders.each do |reader|
      	  if reader.orders.include? book_title
      		  result << reader.name
      	  end
        end
  	  end
      result.uniq
    end

    def who_often_takes_the_book (book_title)
     result = []
     orders = @orders.each do |order|
      result << order.reader if order.book == book_title
     end
     result.inject(Hash.new(0)) { |hash, reader| hash[reader] += 1; hash}.max_by(1){|k, v| v}

    end

    def save_data
      f = File.open(LIB_DATA_DUMP, "w")
      f.write(YAML::dump(self))
      f.close
    end

    def self.load_data
      YAML::load(File.read(LIB_DATA_DUMP))
    end

  end

end
