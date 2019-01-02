
def reverser
  a = yield
  a.split().map(&:reverse).join(' ')
end

# or
# def reverser (&block)
#   a = block.call
#   a.split().map(&:reverse).join(' ')
# end

def adder (n = 1)
  a = yield
  a + n
end

def repeater (n = 1)
  n.times { |i| yield }
end

BEGIN { 
  puts 'begin'
} 
 
END { 
  puts 'end'
}

puts 'main'

# begin
# main
# end
