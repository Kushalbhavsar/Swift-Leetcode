/*
Link: https://leetcode.com/problems/find-the-index-of-the-first-occurrence-in-a-string
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: haystack = "sadbutsad", needle = "sad"
 Output: 0
 Explanation: "sad" occurs at index 0 and 6.
 The first occurrence is at index 0, so we return 0.

 #Example 2:
 Input: haystack = "leetcode", needle = "leeto"
 Output: -1
 Explanation: "leeto" did not occur in "leetcode", so we return -1.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
*/


// Brute-force Solution

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O((n-m) * n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func strStr_BruteForce(_ haystack: String, _ needle: String) -> Int {
    for j in 0..<haystack.count {
        let startIndex = haystack.index(haystack.startIndex, offsetBy: j)
        let endIndex = haystack.index(haystack.startIndex,
                                      offsetBy: min(needle.count + j, haystack.count))
        
        if String(haystack[startIndex..<endIndex]) == needle {
            return j
        }
    }
    
    return -1
}

print(strStr_BruteForce("sadbutsad", "sad"))
print(strStr_BruteForce("leetcode", "leeto"))
print(strStr_BruteForce("abcabababc", "ababc"))



// Solution using KMP(Knuth-Morris-Prat) Algorithm
// KMP Algorithm search occurrences of `word` in a given `string` in a linear time.
// https://en.wikipedia.org/wiki/Knuth–Morris–Pratt_algorithm

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(m + n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func strStr(_ haystack: String, _ needle: String) -> Int {
    
    // Find Length of Longest Common Prefix which is also a Suffix.
    func findLPS(str: String) -> [Int] {
        var i = 0
        var lps = Array(repeating: 0, count: str.count)
        
        for j in 1..<str.count {
            
            while i > 0 && str[str.index(str.startIndex, offsetBy: i)] != str[str.index(str.startIndex, offsetBy: j)] {
                i = lps[i - 1]
            }
            
            if str[str.index(str.startIndex, offsetBy: i)] == str[str.index(str.startIndex, offsetBy: j)] {
                i += 1
            }
            
            lps[j] = i
        }
        
        return lps
    }

    
    var n = 0 // Neddle index
    let lps = findLPS(str: needle)
    
    for h in 0..<haystack.count {
        
        while n > 0 && needle[needle.index(needle.startIndex, offsetBy: n)] != haystack[haystack.index(haystack.startIndex, offsetBy: h)] {
            n = lps[n - 1]
        }
        
        if needle[needle.index(needle.startIndex, offsetBy: n)] == haystack[haystack.index(haystack.startIndex, offsetBy: h)] {
            n += 1
        }
        
        if n == needle.count {
            return h - (n - 1)
        }
    }
    
    return -1
}



print(strStr("sadbutsad", "sad"))
print(strStr("leetcode", "leeto"))
print(strStr("abcabababc", "ababc"))

