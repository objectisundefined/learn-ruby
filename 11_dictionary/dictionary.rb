
# check value type
# https://stackoverflow.com/questions/15769739/determining-type-of-an-object-in-ruby

class Dictionary < Hash
  @entries

  def initialize
    @entries = Hash.new
  end

  def add (params)
    # params.key
    puts "params #{params}"
    type = params.class
    @entries.merge!(type == Hash ? params : { params => nil })
  end

  def entries
    @entries
  end

  def keywords
    @entries.keys.sort
  end

  def include? (k)
    @entries.include? k
  end

  def find (p)
    @entries.keys.reduce({}) { |a, k| k.match(p) == nil ? a : a.merge({ k => @entries[k] }) }
  end

  def printable
    self.keywords.reduce([]) { |a, k| a.concat ["[#{k}] \"#{@entries[k]}\""] } .join("\n")

    # this works, but it is to completed
    # %Q"#{self.keywords.reduce([]) { |a, k| a.concat ["[#{k}] \"#{@entries[k]}\""] } .join("\n")}"
  end

end

d = Dictionary.new
d.add('zebra' => 'African land animal with stripes')
d.add('fish' => 'aquatic animal')
d.add('apple' => 'fruit')
puts d.printable

# %Q{[apple] "fruit"\n[fish] "aquatic animal"\n[zebra] "African land animal with stripes}"}
# %Q{[apple] "fruit"\n[fish] "aquatic animal"\n[zebra] "African land animal with stripes"}
