class LinkedList
  
  def initialize
    @list = []
  end

  def append(data=nil)
    @list << Node.new(data) 
    @list[-2].next_node = @list[-1] unless @list.length == 1
    @list[0].next_node = @list[1] if @list.length == 2
  end

  def prepend(data=nil)
    @list.unshift(Node.new(data))
    update_node_links
  end

  def insert_at(index, data=nil)
    @list.insert(index, Node.new(data))
    update_node_links(index)
  end

  def remove_at(index)
    @list.delete_at(index)
    update_node_links(index)
  end

  def size
    @list.length
  end

  def head
    @list[0]
  end

  def tail
    @list[-1]
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
  end

  def contains?(data)
    @list.each { |node| return true if node.value == data }
  end

  def find(data)
    @list.each_with_index { |node, index| return index if node.value == data }
    nil
  end

  def to_s
    @list.each_with_index do |node, index|
      print "#{node.value} -> "
      puts "nil" if node.next_node == nil 
    end
  end

  def update_node_links(index=0)
    @list[index...-1].each_with_index do |node, nodes_index|
      node.next_node = @list[nodes_index + 1]
    end
  end

end

class Node
  attr_accessor :value, :next_node

  def initialize(data=nil)
    @value = data
    @next_node = nil
  end

end


my_list = LinkedList.new

my_list.append("I like horses")
my_list.append("Hi there")
puts "List find method output: "
puts my_list.find("I like horses")
puts ""
puts "Next node of head value: "
puts my_list.head.next_node.value
puts ""
puts "List to_s method output: "
my_list.to_s
my_list.prepend("Good morning")
puts ""
puts "List to_s method output after prepend: "
my_list.to_s
puts ""
puts "List contains? method output: "
puts my_list.contains?("I like horses")
puts ""
my_list.insert_at(1, "Yo sup dude")
puts "to_s output after insert_at(1): "
my_list.to_s
puts ""
my_list.remove_at(1)
puts "to_s output after remove_at(1): "
my_list.to_s
puts ""
