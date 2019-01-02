
def add (a, b)
  a + b
end

def subtract (a, b)
  a - b
end

def sum (arr)
  arr.reduce(0, :+)
end

def multiply (*arr)
  arr.reduce(1, :*)
end

def power (n, exp)
  # exp == 0 ? 1 : exp > 0 ? n * multiply(n, exp - 1) : 1.0 / n / power(n, exp + 1)
  if exp == 0 then
    1
  elsif exp > 0 then
    n * multiply(n, exp - 1)
  else
    1.0 / n / power(n, exp + 1)
  end
end

# 0! = 1
def factorial (n)
  n < 2 ? 1 : n * factorial(n - 1)
end
