/*
Link: https://leetcode.com/problems/maximum-odd-binary-number
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 You are given a binary string s that contains at least one '1'.

 You have to rearrange the bits in such a way that the resulting binary number is the maximum odd binary number that can be created from this combination.

 Return a string representing the maximum odd binary number that can be created from the given combination.

 Note that the resulting string can have leading zeros.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: s = "010"
 Output: "001"
 Explanation: Because there is just one '1', it must be in the last position. So the answer is "001".
 
 #Example 2:
 Input: s = "0101"
 Output: "1001"
 Explanation: One of the '1's must be in the last position. The maximum number that can be made with the remaining digits is "100". So the answer is "1001".
*/

// Solution - 1
// Brute-force

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n log n) ~ `sort(by:)` operation has a time complexity of O(n log n)
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func maximumOddBinaryNumberBruteForce(_ s: String) -> String {
    var array = ArraySlice(s)
    array.sort(by: { $0 > $1 })
    
    array.removeFirst()
    array.append("1")

    return String(array )
}


maximumOddBinaryNumberBruteForce("010")
maximumOddBinaryNumberBruteForce("0101")
maximumOddBinaryNumberBruteForce("101100")


// Solution - 2

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n) ~ `filter` function iterates through each character in the string once.
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func maximumOddBinaryNumber(_ s: String) -> String {
    let onesCount = s.filter({ $0 == "1"}).count
    let totalZeros = s.count - onesCount
    
    return String(repeating: "1", count: onesCount - 1) + String(repeating: "0", count: totalZeros) + "1"
}


maximumOddBinaryNumber("010")
maximumOddBinaryNumber("0101")
maximumOddBinaryNumber("101100")
