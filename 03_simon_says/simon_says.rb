
def echo (s)
  s
end

def shout (s)
  s.upcase
end

def repeat (s, n = 2)
  puts (0..n)
  ((1..n).reduce([]) { |a, b| a.concat([s]) }).join(' ')
end

def start_of_word (s, n = 0)
  s.slice(0, n)
end

def first_word (s)
  s.split(/\s/)[0]
end

# 'a B C'.capitalize => 'A b c'
# .map.with_index or each_with_index.map
def titleize (s)
  littles = ['and', 'or', 'the', 'over', 'to', 'the', 'a', 'but']
  s.split(/\s|\_|\-/).map.with_index { |a, i| littles.include?(a) && i > 0 ? a : a.capitalize } .join(' ')
end
