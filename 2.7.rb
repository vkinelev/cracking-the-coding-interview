<<~TASK
2.7 Intersection: Given two (singly) linked lists, determine if the two lists intersect. Return the intersecting
node. Note that the intersection is defined based on reference, not value. That is, if the kth
node of the first linked list is the exact same node (by reference) as the jth node of the second
linked list, then they are intersecting.
Hints: #20, #45, #55, #65, #76, #93, #111, #120, #129

Questions
1.

Solutions
1. Count a number of nodes n1 and n2 in the both lists. If pointers end up in
the same node, then the lists have intersestion. Lists may have different number
of nodes before the intersection, and this difference is equal to abs(n2 - n1)
nodes. We make one more run over the lists. This time a pointer which runs over
the longer list starts from the abs(n2 - n1)th node, thus both pointers reach
the intersection at the same time. Return the node when both pointers point to
the same node, it is our intersection.

Input Data Checks or Edge Cases
1. Ensure head nodes are not null
2. An intersection of equal lists is their head.
TASK
require './data_structures/linked_list'

def get_intersection_node(head1, head2)
  raise 'both heads must not be nil' unless head1 && head2
  return head1 if head1 == head2

  tail1, n1 = get_last_node_and_length(head1)
  tail2, n2 = get_last_node_and_length(head2)
  return nil if tail1 != tail2

  p1, p2 = head1, head2
  p1_skip_count, p2_skip_count = n2 - n1, n1 - n2
  while p1 != p2
    if p1_skip_count > 0
      p1_skip_count -= 1
    else
      p1 = p1.next
    end

    if p2_skip_count > 0
      p2_skip_count -= 1
    else
      p2 = p2.next
    end
  end
  p1
end

def get_last_node_and_length(head)
  n = 0
  current_node = head
  while current_node
    current_node = current_node.next
    n += 1
  end
  return current_node, n
end

intersection = LinkedList::Node.new(1)
intersection
  .append(2)
  .append(4)
  .append(6)

head1 = LinkedList::Node.new(7)
head1
  .append(1)
  .append(2)
  .append(intersection)

head2 = LinkedList::Node.new(4)
head2
  .append(1)
  .append(2)
  .append(2)
  .append(2)
  .append(intersection)

result = get_intersection_node(head1, head2)
puts result.object_id, intersection.object_id, result.object_id == intersection.object_id
