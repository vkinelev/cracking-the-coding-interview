<<~TASK
Implement an algorithm to find the kth to last element of a singly linked list.
Hints: #8, #25, #47, #67, # 726

Questions
1. What kind of data is stored in the list? (Integer)
2. K = 0 means the last node, K = N-1 means the first node

Solutions
1. Count all nodes in the list. Then Go to (n - k) node, where n is n the number
of all nodes. Time complexity is O(N) and space is O(1)

Input Data Checks or Edge Cases
1. Raise if k < 0
2. Return nil if number of nodes is lesser than k

TASK
require './data_structures/linked_list'

head = LinkedList::Node.new(1, 2, 3, 4, 5, 6, 7, 8)

def get_kth_to_last_element(head, k)
  raise 'k should be greater or equal to zero' if k < 0

  size = 0
  current_node = head
  while current_node
    current_node = current_node.next
    size += 1
  end
  return nil if k > size - 1

  target_node = head
  1.upto(size - k - 1) do
    target_node = target_node.next
  end
  target_node
end

p get_kth_to_last_element(head, 0).data
p get_kth_to_last_element(head, 7).data
p get_kth_to_last_element(head, 8)
p get_kth_to_last_element(head, 2).data
