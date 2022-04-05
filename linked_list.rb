
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
        puts "start appending"
        if @head.nil?
            @head = Node.new(value)
            @tail = Node.new(value)
        else
            new_tail = Node.new(value)            
            @tail.next_node = new_tail
            puts "Added #{@tail.next_node.value} to the previous tail #{@tail}"           
            new_tail.next_node = nil            
            @tail = new_tail
            puts "New tail is #{@tail} followed by #{@tail.next_node.nil?}"
        end
        puts "end appending"
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

    def size
        counter = 0
        if @head.nil?
            return counter
        else
            self.each { |node| counter += 1}
        end

        return counter
    end

    def head
        @head
    end

    def tail
        @tail
    end

    def at(index)
        node_at_index = -1
        if index >= self.size
            return node_at_index
        else
            node_at_index = @head
            counter = 0
            unless counter == index                
                node_at_index = node_at_index.next_node
                counter += 1                    
            end                                
        end                
    
        node_at_index
    end

    def pop
        if @head.nil?
            nil
        elsif self.size == 1
            @head = nil
            @tail = nil
        else
            current_node = @head
            next_node = @head.next_node
            unless next_node == @tail
                current_node = next_node
                next_node = next_node.next_node
                
            end
            current_node.next_node = nil
        end
    end

end

class Node
    attr_accessor :value, :next_node

    def initialize(value)
        @next_node = nil
        @value = value
    end

    def to_s
        @value
    end
end


list = LinkedList.new
list.prepend('new first')
list.prepend('last')
list.prepend('A')
list.append('X')
puts list
puts list.size
#list.pop
#list.pop
#list.pop
#puts list

