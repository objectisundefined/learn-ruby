
class Timer
  @seconds
  @time_string

  # constructor
  def initialize (*args)
    puts "Timer initialize"
    @seconds = 0
  end

  def seconds
    @seconds
  end

  def time_string
    @time_string
  end

  def padded (s)
    # can't call '' + 1
    (s < 10 ? '0' : '') + s.to_s()
  end

  def seconds= (n)
    @seconds = n

    t = n / 60
    hours = t / 60
    minutes = t % 60
    seconds = n % 60

    @time_string = [hours, minutes, seconds].map { |s| self.padded s } .join(':')
  end
end
