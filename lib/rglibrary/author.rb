module RGLibrary
  class Author
  	#@name, @biography
  	attr_reader :name
  	def initialize(name, biography)
  		@name, biography = name, biography
  	end
  end
end