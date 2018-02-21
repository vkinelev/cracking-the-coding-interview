<<~TASK
URLify: Write a method to replace all spaces in a string with '%20: You may assume that the string
has sufficient space at the end to hold the additional characters, and that you are given the "true"
length of the string. (Note: If implementing in Java, please use a character array so that you can
perform this operation in place.)

EXAMPLE
Input: "Mr John Smith    ", 13
Output:"Mr%20John%20Smith"

Questions
1.

Solutions
1. Scan string and calculate shifting for the every char in a string A. A shift
equals `number_of_spaces_before_char * 2`. Shifts are stored in an auxuliary
array of a size `real_length`. An element at index K stores a shift of char in
string A at the same index K. Cycle through the string in the reverse order making
shifts and adding `%20` where necessary. Note, we don't make an actual shift, because
we have enough space in the string and we just replace reserved spaces by chars.
Time complexity is O(N). Space complexity is O(N)

2'. Space complexity improving. We don't need auxiliary array and can just decrease
a space counter everytime we make a replace of the space by `%20`

Input Data Checks
1.

TASK

def urlify(a, real_length)
  number_of_spaces = 0

  0.upto(real_length - 1) do |k|
    number_of_spaces += 1 if (a[k] == ' ')
  end

  (real_length - 1).downto(0) do |k|
    if a[k] == ' '
      number_of_spaces -= 1
      a[k + number_of_spaces * 2] = '%'
      a[k + 1 + number_of_spaces * 2] = '2'
      a[k + 2 + number_of_spaces * 2] = '0'
    else
      a[k + number_of_spaces * 2] = a[k]
    end
  end

  a
end

a = "Mr John Smith    "
puts urlify(a.dup, 13)

a = "  Mr John Smith        "
puts urlify(a.dup, 15)
