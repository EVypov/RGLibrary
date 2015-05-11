module RGLibrary
  class Book
  	
  	attr_accessor :title, :author, :times_taken

  	def initialize(title, author, times_taken = 0)
  		@title = title
  		@times_taken = times_taken
  		@author = author
  	end

  	def take_the_book
  		@times_taken += 1
  	end
  end
end