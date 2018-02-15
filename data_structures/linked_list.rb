module LinkedList
  class Node
    attr_accessor :next, :data

    def initialize(*values)
      raise 'at least one integer should be provided' if values.size == 0

      @data = values.shift
      @next = nil

      current_node = self
      values.each do |value|
        current_node = current_node.append(value)
      end
    end

    def append(data_or_node)
      @next = data_or_node.instance_of?(Node)? data_or_node : Node.new(data_or_node) 
    end

    def delete_after
      @next = @next ? @next.next : nil
    end
  end
end
