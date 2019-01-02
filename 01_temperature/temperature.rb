# one line comment

=begin
multiple-line
comments
=end

# https://richonrails.com/articles/rounding-numbers-in-ruby

class Float
  def floor2 (exp = 0)
    multiplier = 10 ** exp
    (self * multiplier).to_i() / multiplier.to_f()
  end

  def ceil2 (exp = 0)
    multiplier = 10 ** exp
    a = self * multiplier
    b = a.to_i()
    c = a - b > 0 ? 1 : 0
    (b + c) / multiplier.to_f()
  end
end

puts 1.888.floor2(2) # returns 1.88
puts 1.888.floor2(1) # returns 1.8

puts 1.884.ceil2(1) # returns 1.9
puts 1.884.ceil2(2) # returns 1.89

def ftoc (f)
  ((f - 32) / (9.0 / 5.0)).round()
end

def ctof (c)
  (32 + c * 9.0 / 5.0).round(1)
end
