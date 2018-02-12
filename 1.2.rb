<<~TASK
A string A is a permutation of a string B if A consists of the exactly same
characters as B. An order of characters in A is not important.

Example: bbdca is permutation of abcdb

Questions
1. Do strings have the same length? (YES)
2. Number of characters in the charset? ASCII, extended ASCII, Unicode? (ASCII, 256)
3. Case-sensitive? (YES)
4. Is whitespace significant? (YES)

Solutions
1. Sort both A and B strings and compare sorted strings starting from 0. A is
a permutation of B is A-sorted equal to B-sorted. Time-complexity is O(N*LOG(N)).
Space is O(1), though some sorting algorithms may use auxuliary data structures.

2'. Count occurrences of chars in A and B. If occurrences are equal, than A is
a permutation of B. Time complexity is O(N). Space complexity is O(c), where `c`
is a number of chars in the character set.

Input Data Checks
1. A and B must not be blank

TASK

def is_permutation(a, b)
  raise 'a and b must not be empty' unless a.length > 0 && b.length > 0
  return false if a.length != b.length

  c = 256
  chars = Array.new(c, 0)
  a.each_codepoint { |codepoint| chars[codepoint] += 1 }
  b.each_codepoint do |codepoint|
    chars[codepoint] -= 1
    return false if chars[codepoint] < 0
  end
  true
end

puts is_permutation('abc', 'bca')
puts is_permutation('abc', 'abc')
puts is_permutation('abc1', 'bca')
