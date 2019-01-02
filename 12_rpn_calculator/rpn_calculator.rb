
class RPNCalculator
  @operators
  @stack
  @value

  def initialize ()
    @operators = {
      '+' => :+,
      '-' => :-,
      '*' => :*,
      '/' => :/,
    }

    @stack = []
    @value = 0
  end

  def value
    @value
  end

  def operators
    @operators
  end

  def check
    if @stack.length < 2
      raise 'calculator is empty'
    end
  end

  def push (v)
    @stack.push(v)
  end

  def plus ()
    self.check()

    b = @stack.pop
    a = @stack.pop

    @value = a + b
    @stack.push(@value)
  end
  
  def minus ()
    self.check()

    b = @stack.pop
    a = @stack.pop

    @value = a - b
    @stack.push(@value)
  end

  def divide ()
    self.check()

    b = @stack.pop
    a = @stack.pop

    @value = a.to_f / b
    @stack.push(@value)
  end

  def times ()
    self.check()

    b = @stack.pop
    a = @stack.pop

    @value = a * b
    @stack.push(@value)
  end

  def tokens (s)
    s.split(/\s/).map { |t| self.operator?(t) ? @operators[t] : t.to_i() }
  end

  def operator? (t)
    @operators.has_key?(t)
  end

  def evaluate (s)
    @stack = []
    @value = 0

    tokens = self.tokens(s)
    l = tokens.length
    i = 0

    while i < l do
      t = tokens[i]

      if t == :+ then self.plus()
      elsif t == :- then self.minus()
      elsif t == :* then self.times()
      elsif t == :/ then self.divide()
      else self.push(t) end

      i = i + 1
    end

    @value
  end

end
