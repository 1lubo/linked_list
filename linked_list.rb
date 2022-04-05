


class LinkedList

    include Enumerable

    attr_accessor :name
    
    def initialize
        @head = nil
        @tail = nil
    end

    def prepend(value)
        node = Node.new(value)

        if @head.nil?
            @head = @tail = node
        else            
            node.next_node = @head
            @head = node
        end
    end

    def append(value)
        node = Node.new(value)

        if @head.nil?            
            @head = @tail = node
        else  
            @tail.next_node = node                                
            @tail = node      
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
            puts "List is already empty"
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

    def contains(value)
        contains = false

        if @head.nil?
            contains
        else
            node = @head
            while node
                if node.value == value
                    return contains = true
                end
                node = node.next_node
            end
        contains
        end
    end

    def find(value)
        index = nil

        if @head.nil?
            index
        else
            index = 0
            node = @head
            
            while node
                if node.value == value
                   return index
                end                
                node = node.next_node
                index += 1
            end
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

    def next_node=(node)
        @next_node = node
    end
end


list = LinkedList.new

list.append('old first')
list.append('new first')

puts list

puts list.find(1)
puts list.find('new first')

