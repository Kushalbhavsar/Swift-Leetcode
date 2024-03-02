/*
Link: https://leetcode.com/problems/squares-of-a-sorted-array
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 
 #Example 2:
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
*/

// Brute-force Solution

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n log n) ~ `sorted` operation has a time complexity of O(n log n)
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func sortedSquaresBruteForce(_ nums: [Int]) -> [Int] {
    return nums.map { $0 * $0 }.sorted()
}


/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func sortedSquares(_ nums: [Int]) -> [Int] {
    var result = [Int]()
    var left: Int = 0
    var right: Int = nums.count - 1
    
    while left <= right {
        if abs(nums[left]) > abs(nums[right]) {
            result.append(squareNumber(nums[left]))
            left += 1
        } else {
            result.append(squareNumber(nums[right]))
            right -= 1
        }
    }
    
    return result.reversed()
}

func squareNumber(_ num: Int) -> Int {
    return num * num
}
