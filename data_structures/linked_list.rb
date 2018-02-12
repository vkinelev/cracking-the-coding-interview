module LinkedList
  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
      @next = nil
    end

    def append(data)
      @next = Node.new(data)
    end

    def delete_after
      @next = @next ? @next.next : nil
    end
  end
end
