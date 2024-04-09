/*
Link: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given a string s, check if it can be constructed by taking a substring of it and appending multiple copies of the substring together.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: s = "abab"
 Output: true
 Explanation: It is the substring "ab" twice.

 #Example 2:
 Input: s = "aba"
 Output: false

 #Example 3:
 Input: s = "abcabcabcabc"
 Output: true
 Explanation: It is the substring "abc" four times or the substring "abcabc" twice.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
*/


// Solution 1: Using String Concatenation

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func repeatedSubstringPatternSC(_ s: String) -> Bool {
    let concatenatedStr = s + s
    let str = concatenatedStr.dropFirst().dropLast()
     
    return str.range(of: s) != nil
}

repeatedSubstringPatternSC("aba")
repeatedSubstringPatternSC("babbabbabbabbab")
repeatedSubstringPatternSC("abab")


// Solution 2: Using KMP Algorothm
// First we calculate the LPS array of given string.
// Then we check for the prefix that repeats at least twice exists, and given string length is divisible by the length of the repeated prefix.

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */


func repeatedSubstringPattern(_ s: String) -> Bool {
    
    // Helper function to calculate LPS.
    func findLPS(str: String) -> [Int] {
        // String's `count()` methods takes O(n), so we have to convert srting into Array for easy access. Using String's `count()` in for loop will give us TLE.
        // Read more at: https://stackoverflow.com/questions/50568726/what-is-the-bigo-of-swifts-string-count/50571137#50571137\
        var sArray = Array(s)
        var lps = Array(repeating: 0, count: sArray.count)
        var j = 0
        
        for i in 1..<sArray.count {
            
            while j > 0 && sArray[i] != sArray[j] {
                j = lps[j - 1]
            }
            
            if sArray[i] == sArray[j] {
                j += 1
            }
            
            lps[i] = j
        }
        
        return lps
    }
    
    
    let lps = findLPS(str: s)
    let n = s.count
    let longestPrefixLength = lps[n - 1]
    
    return longestPrefixLength > 0 && (n % (n - longestPrefixLength) == 0)
}

repeatedSubstringPattern("aba")
repeatedSubstringPattern("a")
repeatedSubstringPattern("abab")
repeatedSubstringPattern("babbabbabbabbab")
repeatedSubstringPattern("aa")
