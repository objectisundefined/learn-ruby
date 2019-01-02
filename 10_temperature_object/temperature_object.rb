
# copy from 01_temperature/temperature.rb
def ftoc (f)
  ((f - 32) / (9.0 / 5.0)).round()
end

def ctof (c)
  (32 + c * 9.0 / 5.0).round(1)
end

class Temperature
  @c
  @f

  def initialize (params)
    c = params[:c]
    f = params[:f]

    if c != nil then
      @c = c
      @f = ctof(c)
    elsif f != nil then
      @f = f
      @c = ftoc(f)
    else end
  end

  def in_celsius
    @c
  end

  def in_fahrenheit
    @f
  end

  # define class method with self.some_method
  def self.from_celsius (c)
    Temperature.new(:c => c)
  end

  def self.from_fahrenheit (f)
    Temperature.new(:f => f)
  end

end

# inheritance
class Celsius < Temperature
  def initialize (c)
    super(:c => c)
  end
end

class Fahrenheit < Temperature
  def initialize (f)
    super(:f => f)
  end
end
