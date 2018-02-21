<<~TASK
String Rotation: Assume you have a method isSubstring which checks if one word
is a substring of another. Given two strings, s1 and s2, write code to check if
s2 is a rotation of s1 using only one call to isSubstring (e.g., "waterbottle"
is a rotation of"erbottlewat").
Hints: #34, #88, #104

Questions
1. Equal strings, are a special kind of a rotation. (YES)
2. What is a time complexity of isSubstring and should I count it. (YES, O(N))
3. I suppose that I must use isSubstring, right?. (YES)

Solutions
1. Make s3 such as s3 = s1 + s1. Use isSubstring to check if s2 is a substring of
s1. If yes, than s2 is a rotation of string s1. T = O(N), S = O(N)

Input Data Checks
1. Length of s1 and s2 must be equal

TASK

def is_rotation(s1, s2)
  raise 's1 and s2 must have equal length' if s1.length != s2.length

  s1 << s1
  is_substring(s1, s2)
end

def is_substring(a, b)
  a.include?(b)
end
