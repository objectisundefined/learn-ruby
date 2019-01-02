
require "time"

def measure (n = 1)
  a = Time.now
  n.times { |i| yield }
  b = Time.now
  (b - a) / n.to_f
end
