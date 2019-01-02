
class Fixnum
  def in_words
    if self == 0 then 'zero'
    elsif self == 1 then 'one'
    elsif self == 2 then 'two'
    elsif self == 3 then 'three'
    elsif self == 4 then 'four'
    elsif self == 5 then 'five'
    elsif self == 6 then 'six'
    elsif self == 7 then 'seven'
    elsif self == 8 then 'eight'
    elsif self == 9 then 'nine'
    elsif self == 10 then 'ten'
    elsif self == 11 then 'eleven'
    elsif self == 12 then 'twelve'
    elsif self == 13 then 'thirteen'
    elsif self == 14 then 'fourteen'
    elsif self == 15 then 'fifteen'
    elsif self == 16 then 'sixteen'
    elsif self == 17 then 'seventeen'
    elsif self == 18 then 'eighteen'
    elsif self == 19 then 'nineteen'
    elsif self == 20 then 'twenty'
    elsif self == 30 then 'thirty'
    elsif self == 40 then 'forty'
    elsif self == 50 then 'fifty'
    elsif self == 60 then 'sixty'
    elsif self == 70 then 'seventy'
    elsif self == 80 then 'eighty'
    elsif self == 90 then 'ninety'
    else
      # hundred  : 100
      # thousand : 1000
      # million  : 1_000_000
      # billion  : 1_000_000_000
      # trillion : 1_000_000_000_000

      if self < 100 
        b = self % 10
        a = self - b

        return a.in_words + (b == 0 ? '' : ' ' + b.in_words)
      end

      arr = [
        # [[weight, condition, str]]
        [100,       lambda { |x| x < 1000 ** 1 }, 'hundred'],
        [1000 ** 1, lambda { |x| x < 1000 ** 2 }, 'thousand'],
        [1000 ** 2, lambda { |x| x < 1000 ** 3 }, 'million'],
        [1000 ** 3, lambda { |x| x < 1000 ** 4 }, 'billion'],
        # always return true to match a very very big number
        [1000 ** 4, lambda { |x| true },          'trillion']
      ]

      i = 0
      l = arr.length

      while i < l do
        # or arr[i][1] [self]
        if arr[i][1].call self 
          break
        end

        i = i + 1
      end

      a = self / arr[i][0]
      b = self % arr[i][0]

      return a.in_words + ' ' + arr[i][2] + (b == 0 ? '' : ' ' + b.in_words)
    end
  end

end
