
class Array
  def sum
    self.reduce(0) { |a, i| a + i }
  end

  def square
    self.reduce([]) { |a, i| a.concat [i ** 2] }
  end

  def square!
    self.each.with_index { |v, i| self[i] = v ** 2 }
  end

end
