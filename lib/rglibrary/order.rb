require 'date'

module RGLibrary
	class Order
		attr_accessor :book, :reader, :date
		def initialize(book, reader, date = Time.now)
			@book = book
			@reader = reader
			@date = date
		end
	end
end
