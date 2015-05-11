module RGLibrary
  class Reader
    attr_reader :name, :orders
    attr_accessor :orders

    def initialize(name, email, city, street, house)
      @name = name
      @email = email
      @city = city
      @street = street
      @house = house
      @orders = []
    end

    def make_an_order(book)
      @orders << book.title if book.is_a?(Book)
    end
  end
end