/*
Link: https://leetcode.com/problems/search-insert-position
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: nums = [1,3,5,6], target = 5
 Output: 2

 #Example 2:
 Input: nums = [1,3,5,6], target = 2
 Output: 1

 #Example 3:
 Input: nums = [1,3,5,6], target = 7
 Output: 4

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
*/

// Solution Using Binary Search as it solution required O(log n) runtime complexity.

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(log n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        // Adding two really big Ints might cause `Memory Overflow`
        // So instead of adding them like (Left + Right) we will find the distance between two numbers & devide them by two.
        let mid = left + (right - left) / 2
        
        if nums[mid] > target {
            right = mid - 1
        } else if nums[mid] < target {
            left =  mid + 1
        } else {
            // We are at target's index
            return mid
        }
    }
    
    return left
}

searchInsert([1,3,5,6], 5)
searchInsert([1,3,5,6], 2)
searchInsert([1,3,5,6], 7)
