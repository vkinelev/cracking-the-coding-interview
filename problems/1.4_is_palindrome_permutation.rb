<<~TASK
Palindrome Permutation: Given a string, write a function to check if it is a permutation of
a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A
permutation is a rearrangement of letters. The palindrome does not need to be limited to just
dictionary words.
EXAMPLE
Input: Tact Coa
Output: True (permutations:"taco cat'; "atco cta '; etc.)

Questions
1. Should we take spaces into account? (NO)
2. Do we use only lower case letters and space? (YES, charset is 26 chars)

Solutions
1. A string is a palindrome permutation if maximum one character has odd
number of occurances, all other characters have even or zero occurances. Thus,
we don't need to know the exact number of occurance, but if it is even or odd.
If some 0-1 flag is toggled for a char everytime it occurs in the string, then
we result in 0 if there are even occurances, otherwise the flag should be 1.
An integer variable `checker` acting as a bit vector can be used to store
a set of flags for the charcter set. Time complexity is O(N). Space complexity
O(1)

Input Data Checks
1. Return false if empty string

TASK

def is_palindrome_permutation(a)
  return false if a.length == 0

  checker = 0
  a.each_codepoint do |codepoint|
    next if codepoint == 32
    checker = toggle(checker, codepoint)
  end
  checker == 0 || ((checker - 1) & checker) == 0
end

def toggle(checker, codepoint)
  position = codepoint - "a".ord
  checker ^= 1 << position
end

# false
puts is_palindrome_permutation('tacoztacoy')
# true
puts is_palindrome_permutation('taco taco')
