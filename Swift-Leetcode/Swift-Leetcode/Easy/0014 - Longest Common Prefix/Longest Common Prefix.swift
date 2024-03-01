//
//  Longest Common Prefix.swift
//  Swift-Leetcode
//
//  Created by Kush on 01/03/24.
//

/*
Link: https://leetcode.com/problems/longest-common-prefix
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".
 
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: strs = ["flower","flow","flight"]
 Output: "fl"
 
 #Example 2:
 Input: strs = ["dog","racecar","car"]
 Output: ""
 Explanation: There is no common prefix among the input strings.
*/

func longestCommonPrefix(_ str: [String]) -> String {
    
    // Find the shortest string in array.
    guard let shortestString = str.min(by: { $0.count < $1.count }) else { return ""}
    
    for (i, char) in shortestString.enumerated() {
        for word in str {
            if word[word.index(word.startIndex, offsetBy: i)] != char {
                return String(shortestString.prefix(i))
            }
        }
    }
    
    return shortestString
}

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(N*M) ~ where N be the number of strings & M be the length of shortest string
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */
