<<~TASK
Write code to remove duplicates from an unsorted linked list.
FOLLOW UP
How would you solve this problem if a temporary buffer is not allowed?
Hints: #9, #40

Questions
1. Singly linked list or doubly linked list (Singly)
2. What kind of data is stored in the list? (Integer) 

Solutions
1. Use two `pointers` and do a regular nested loop. time complexity O(N^2) and
  space is O(1)
2. Use hash and one cycle. time complexity is O(N) and space is O(N)

Input Data Checks
1. Ensure not nil and at least two nodes

TASK
require './data_structures/linked_list'

head = LinkedList::Node.new(1, 2, 2, 2, 4, 3, 3, 3, 2, 4, 4)

def unique!(head)
  return nil unless head
  return head unless head.next

  first = head
  while first
    replacer = first
    while replacer && replacer.next
      if first.data == replacer.next.data
        replacer.delete_after
      else
        replacer = replacer.next
      end
    end
    first = first.next
  end

  head
end

def unique_with_hash!(head)
  return nil unless head
  return head unless head.next

  current_node = head
  hash = { current_node.data => current_node }
  while current_node && current_node.next
    if hash[current_node.next.data]
      current_node.delete_after
    else
      hash[current_node.next.data] = current_node.next
      current_node = current_node.next
    end
  end
  head
end

p unique!(head)
p unique!(nil)
p unique!(LinkedList::Node.new(1))

p unique_with_hash!(head)
