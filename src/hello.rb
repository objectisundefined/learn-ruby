puts 'hello world'

puts "Reading Celsius temperature value from data file..."
num = File.read("./src/temp.dat")
celsius = num.to_i
fahrenheit = (celsius * 9 / 5) + 32
puts "The number is " + num
print "Result: "
puts fahrenheit

# only has arr parameter, block with be transformed to proc
# def map_with_index (arr, &block)
#   i = 0
#   l = arr.length
#   r = []

#   while i < l do
#     r.push (block.call(arr[i], i))

#     i = i + 1
#   end

#   r
# end

# puts (map_with_index [1, 2, 3, 4, 5] { |x, i| "#{i} #{x}" })

# block as a parameter
def map_with_index (arr, block)
  i = 0
  l = arr.length
  r = []

  while i < l do
    r.push (block.call(arr[i], i))

    i = i + 1
  end

  r
end

# Proc.new, proc or lambda
puts map_with_index([1, 2, 3, 4, 5], proc { |x, i| [i, x] })

# Ruby Proc，Lambda, see https://www.jianshu.com/p/5f205f650a90
# difference 1: return
#proc and lambda
def run_a_proc(p)
  puts 'start...'
  p.call
  puts 'end.'
end

# lambda, lambda
# def run_couple
#   run_a_proc lambda { puts 'I am a lambda'; return }
#   run_a_proc lambda { puts 'I am a lambda'; return }
# end

# start...
# I am a lambda
# end.
# start...
# I am a lambda
# end.

# the lambda will be ignore
# proc, lambda
def run_couple
  run_a_proc proc { puts 'I am a proc'; return }
  run_a_proc lambda { puts 'I am a lambda'; return }
end

# start...
# I am a proc

run_couple

# difference 2: send parameters
# lambda must be called with specified length's parameters

hello_proc = proc do |a, b|
  puts "a = #{a == nil ? 'nil' : a}, b = #{b == nil ? 'nil' : b}"
  puts 'hello proc'
end

# it works, call with nil, nil
hello_proc.call
# it works, call with 1, nil
hello_proc.call 1
hello_proc.call 1, 2
hello_proc [1, 2]

hello_lambda = lambda do |a, b|
  puts 'hello lambda'
end

# hello_lambda.call
# wrong number of arguments (given 0, expected 2) (ArgumentError)

# it works
hello_lambda.call 1, 2
# call with array
hello_lambda [1, 2]

puts 'high-order lambda'
def multiple_gen(m)
  lambda do |n|
    n * m
  end
end

doubler = multiple_gen 2
tripler = multiple_gen 3

puts doubler.call(10) # => 20
puts tripler [10] # => 30

def hello
  'Hello!'
end

def greet (name)
  "Hello, #{name}!"
end

# this works
puts greet 'lanaya'

# Hello, ["lanaya"]!
puts greet ['lanaya']

# invoke proc and lambda, see https://ruby-doc.org/core-2.2.0/Proc.html
a_proc = Proc.new {|a, *b| b.collect {|i| i*a }}
a_proc.call(9, 1, 2, 3)   #=> [9, 18, 27]
a_proc[9, 1, 2, 3]        #=> [9, 18, 27]
a_proc = lambda {|a,b| a}
# can only be called with 2 arguments
a_proc.call(1,2)
