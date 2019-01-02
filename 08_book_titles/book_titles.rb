# copy from 03_simon_says/simon_says.rb
# add ['of', 'in', 'an']
def titleize (s)
  littles = ['and', 'or', 'the', 'over', 'to', 'the', 'a', 'but', 'of', 'in', 'an']
  s.split(/\s|\_|\-/).map.with_index { |a, i| littles.include?(a) && i > 0 ? a : a.capitalize } .join(' ')
end

class Book
  @title

  def title
    @title
  end

  def title= (t)
    @title = titleize(t)
  end
end

book = Book.new

puts book
puts book.title
book.title = 'inferno'
puts book.title
