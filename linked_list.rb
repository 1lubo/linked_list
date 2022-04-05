
class LinkedList

    include Enumerable

    attr_accessor :name
    
    def initialize
        @head = nil
        @tail = nil
    end

    def prepend(value)
        if @head.nil?
            @head = Node.new(value)
            @tail = Node.new(value)
        else
            new_head = Node.new(value)
            new_head.next_node = @head
            @head = new_head
        end
    end

    def append(value)
        if @head.nil?
            @head = Node.new(value)
            @tail = Node.new(value)
        else
            new_tail = Node.new(value)
            new_tail = Node.new(value)
            @tail.next_node = new_tail
            @tail = new_tail
        end
    end

    def each
        return nil if @head.nil?

        node = @head

        until node.nil?
            yield node
            node = node.next_node
        end
    end

    def to_s
        string = ''
        
        self.each do |node|
            if node.next_node.nil?
                string += " (#{node.value}) -> nil"
            else
            string += " (#{node.value}) -> "
            end
        end
        return string
    end

end

class Node
    attr_accessor :value, :next_node

    def initialize(value)
        @next_node = nil
        @value = value
    end
end


list = LinkedList.new
list.append('first')
list.prepend('new first')
puts list