
# magic 'a' * 3 => 'aaa'

class Xml
  def initialize (tag, attrs, children)
    @tag = tag
    @attrs = attrs
    @children = children
  end

  def build (depth, pretty)
    # puts "#{@tag} depth #{depth}"
    attrs = @attrs.keys.reduce([]) { |a, k| a.concat [" #{k}='#{@attrs[k]}'"] } .join('')

    empty = @children.length == 0

    inner = ''

    space = pretty ? ' ' * depth * 2 : ''

    if !empty
      inner = @children.join("\n")
    end

    # case: end with \n the outest tag
    (empty ? "#{space}<#{@tag}#{attrs}/>" : "#{space}<#{@tag}#{attrs}>#{pretty ? "\n" : ''}#{inner}#{pretty ? "\n" : ''}#{space}</#{@tag}>#{depth == 0 && pretty ? "\n" : ''}")
  end

end

class XmlDocument
  def initialize (pretty = false)
    @pretty = pretty
    @index = 0
  end

  def method_missing(m, *args, &block)
    tag = m
    attrs = {}
    children = []

    if (args.length > 0)
      attrs = args[0]
    end

    if (block != nil)
      # use stack
      @index += 1
      child = block.call
      @index -= 1
      children.push(child)
    end

    Xml.new(tag, attrs, children).build(@index, @pretty)
  end
end

xml = XmlDocument.new(pretty = true)
# puts xml.hello
# puts xml.hello(:name => 'dolly')

s = xml.hello do
  xml.goodbye do
    xml.come_back do
      xml.ok_fine(:be => "that_way")
    end
  end
  xml.lalala do
    xml.come_back do
      xml.ok_fine(:be => "that_way")
    end
  end
end

puts s
