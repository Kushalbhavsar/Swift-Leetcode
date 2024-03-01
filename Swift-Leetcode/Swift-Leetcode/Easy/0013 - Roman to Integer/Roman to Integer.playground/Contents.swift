/*
Link: https://leetcode.com/problems/roman-to-integer
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

Given a roman numeral, convert it to an integer.

Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
 
For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

I can be placed before V (5) and X (10) to make 4 and 9.
X can be placed before L (50) and C (100) to make 40 and 90.
C can be placed before D (500) and M (1000) to make 400 and 900.
 
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 # Example:
 Input: s = "LVIII"
 Output: 58
 Explanation: L = 50, V= 5, III = 3.
*/


// Brute-force Algorithm

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func romanToIntBruteForce(_ s: String) -> Int {
    
    var sum: Int = 0
    var prev: Int = 0
    
    let dict: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    
    for character in s {
        switch character {
        case "I": 
            sum += 1
        case "V":
            if prev == 1 {
                sum += 3
            } else {
                sum += 5
            }
        case "X":
            if prev == 1 {
                sum += 8
            } else {
                sum += 10
            }
        case "L":
            if prev == 10 {
                sum += 30
            } else {
                sum += 50
            }
        case "C": 
            if prev == 10 {
                sum += 80
            } else {
                sum += 100
            }
        case "D": 
            if prev == 100 {
                sum += 300
            } else {
                sum += 500
            }
        case "M":
            if prev == 100 {
                sum += 800
            } else {
                sum += 1000
            }
        default: 
            sum = 0
        }
        
        prev = dict[String(character)] ?? 0
    }
    
    
    return sum
}

romanToIntBruteForce("IV")
romanToIntBruteForce("LVIII")
romanToIntBruteForce("MCMXCIV")


/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func romanToInt(_ s: String) -> Int {
    
    var sum: Int = 0
    var prev: Int = 0
    
    let dict: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]

    for character in s {
        if let value = dict[String(character)] {
            if value > prev {
                sum += (value - 2*prev)
            } else {
                sum += value
            }
            prev = value
        } else {
            sum = 0
        }
    }
    
    return sum
}


romanToInt("IV")
romanToInt("LVIII")
romanToInt("MCMXCIV")
