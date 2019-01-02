
def pig_latin
  Proc.new { |s|
    vowel = %w[a e i o u]

    puts "#{s} #{s[0]} #{vowel.include?(s[0])}"

    if s == '' then
      s
    elsif vowel.include?(s[0]) then
      s + 'ay'
    # case 'quiet', 'Quiet'
    elsif s.include? 'qu' or s.match(/^Qu/) then
      # idx = s.split('').index { |a| ['a', 'e', 'i', 'o'].include?(a) }
      idx = s.index(/[aeio]/)
      puts "qu ---- #{idx} #{s[idx].upcase} #{s[idx + 1, s.length - idx - 1]} #{s[0]} #{s[1, idx - 1]}"
      idx == nil ? s : (s.match(/^[A-Z]/) != nil ? s[idx].upcase : s[idx]) + s[idx + 1, s.length - idx - 1] + s[0].downcase + s[1, idx - 1] + 'ay'
    else
      # idx = s.split('').index { |a| vowel.include?(a) }
      idx = s.index(/[aeiou]/)
      idx == nil ? s : (s.match(/^[A-Z]/) != nil ? s[idx].upcase : s[idx]) + s[idx + 1, s.length - idx - 1] + s[0].downcase + s[1, idx - 1] + 'ay'
    end
  }
end

def translate (s)
  s.split(/\s/).map(&pig_latin).join(' ')
end

# https://stackoverflow.com/questions/13498688/pig-latin-method-translation
# but without `capitalized words are still capitalized` case

# def translate str
#   letters = ('a'..'z').to_a

#   vowels = %w[a e i o u]

#   consonants = letters - vowels

#   str2 = str.gsub(/\w+/) do |word|
#       if vowels.include?(word.downcase[0])
#         word + 'ay'
#       elsif (word.include? 'qu')
#         idx = word.index(/[aeio]/)
#         word = word[idx, word.length-idx] + word[0,idx]+ 'ay'
#       else
#         idx = word.index(/[aeiou]/)
#         word = word[idx, word.length - idx] + word[0,idx] + 'ay'
#       end
#   end
# end
