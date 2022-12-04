//
//  Two Sum.swift
//  Swift-Leetcode
//
//  Created by Kush on 04/12/22.
//

/*
Link: https://leetcode.com/problems/two-sum/
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-
 
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.
 
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 # Example:
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 */


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int: Int] = [:]
    
    for (index, value) in nums.enumerated() {
        
        if let num = result[target - value] {
            return [num, index]
        }
        
        result[value] = index
    }
    return []
}
