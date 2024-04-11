/*
Link: https://leetcode.com/problems/length-of-last-word
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given a string s consisting of words and spaces, return the length of the last word in the string.

 A word is a maximal substring consisting of non-space characters only.
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: s = "Hello World"
 Output: 5
 Explanation: The last word is "World" with length 5.

 #Example 2:
 Input: s = "   fly me   to   the moon  "
 Output: 4
 Explanation: The last word is "moon" with length 4.

 #Example 3:
 Input: s = "luffy is still joyboy"
 Output: 6
 Explanation: The last word is "joyboy" with length 6.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
*/

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(n) - Since we're creates an array `sArray` of size `n` to store the characters of the input string.
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */


func lengthOfLastWord(_ s: String) -> Int {
    var length = 0
    var sArray = Array(s)
    var i = sArray.count - 1
    
    while i >= 0 && sArray[i] == " " {
        i -= 1
    }
    
    while i >= 0 && sArray[i] != " " {
        length += 1
        i -= 1
    }
    
    return length
}

lengthOfLastWord("Hello World")
lengthOfLastWord("   fly me   to   the moon  ")
lengthOfLastWord("luffy is still joyboy")


// ----- ---------- ---------- ---------- ---------- --------- ----------- ----------

// Space Optimized Version
/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func lengthOfLastWordSO(_ s: String) -> Int {
    var i = s.count - 1
    var length = 0
    
    while i >= 0 && s[s.index(s.startIndex, offsetBy: i)] == " " {
        i -= 1
    }
    
    while i >= 0 && s[s.index(s.startIndex, offsetBy: i)] != " " {
        length += 1
        i -= 1
    }
    
    return length
}

lengthOfLastWordSO("Hello World")
lengthOfLastWordSO("   fly me   to   the moon  ")
lengthOfLastWordSO("luffy is still joyboy")

