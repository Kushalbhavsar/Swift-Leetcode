/*
Link: https://leetcode.com/problems/remove-duplicates-from-sorted-array
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same. Then return the number of unique elements in nums.

 Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:

 Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially. The remaining elements of nums are not important as well as the size of nums.
 
 Return k.
 
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------

 Solution will be tested with the following code:

 int[] nums = [...]; // Input array
 int[] expectedNums = [...]; // The expected answer with correct length

 int k = removeDuplicates(nums); // Calls your implementation

 assert k == expectedNums.length;
 for (int i = 0; i < k; i++) {
     assert nums[i] == expectedNums[i];
 }
 
 If all assertions pass, then the solution will be accepted.

 
 #Example 1:
 Input: nums = [1,1,2]
 Output: 2, nums = [1,2,_]
 Explanation: Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 #Example 2:
 Input: nums = [0,0,1,1,1,2,2,3,3,4]
 Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
 Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
 It does not matter what you leave beyond the returned k (hence they are underscores).
 
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
*/

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var indexToUpdate: Int  = 1
    var currentNum: Int = nums[0]
    
    for i in 1..<nums.count {
        if nums[i] != currentNum {
            nums[indexToUpdate] = nums[i]
            currentNum = nums[i]
            indexToUpdate += 1
        }
    }
    
    return indexToUpdate
}

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n) ~ it iterates through the entire array once
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

var arr = [1,1,2]
removeDuplicates(&arr)
print(arr)

var arr2 = [0,0,1,1,1,2,2,3,3,4]
removeDuplicates(&arr2)
print(arr2)

