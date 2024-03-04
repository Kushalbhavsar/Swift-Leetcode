/*
Link: https://leetcode.com/problems/palindrome-number/
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-
 
 Given an integer x, return true if x is a palindrome, and false otherwise.
 
 ~~ An integer is a palindrome when it reads the same forward and backward.
    For example, 121 is a palindrome while 123 is not. ~~
 
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 
 #Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 #Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 
 */

func isPalindrome(_ x: Int) -> Bool {
    // Return false for Negative numbers as they can not be Palindrome
    guard x > 0 else { return false }
    
    var number = x
    var reversedNumber = 0
    
    while number > 0 {
        let reminder = number % 10
        reversedNumber = reversedNumber * 10 + reminder
        number = number / 10
    }
   
    return x == reversedNumber
}

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */


isPalindrome(121)
isPalindrome(-121)
isPalindrome(10)
