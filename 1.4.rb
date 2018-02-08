<<~TASK
Palindrome Permutation: Given a string, write a function to check if it is a permutation of
a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A
permutation is a rearrangement of letters. The palindrome does not need to be limited to just
dictionary words.
EXAMPLE
Input: Tact Coa
Output: True (permutations:"taco cat'; "atco cta '; etc.)

Questions
1. Should we take into account space? (NO)
2. Number of chars in the character set? (ASCII, 256)

Solutions
1. Calculate number of occurrences of the every char in the string. Store that
in auxuliary array. Don't take into account spaces. Divide every number in array
by 2 and replace numbers with a result of division. Sum all elements in the array.
For string with even number of chars a sum should be equal to zero. For strings
with odd number of chars a sum should be equal to 1

Input Data Checks
1. Return false if empty string

TASK

def is_palindrome_permutation(a)
  false
end

a = "Mr John Smith    "
puts urlify(a.dup, 13)

a = "  Mr John Smith        "
puts urlify(a.dup, 15)
