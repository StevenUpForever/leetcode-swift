//
//  Q1TwoSum.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/28/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q1TwoSum: NSObject {

    //Difficulty: Easy
    //TAG: Uber
    //TAG: LinkedIn
    //TAG: Airbnb
    //TAG: Snap
    //TAG: Apple
    //TAG: set
    //TAG: array

    /**
     * 1. Two Sum
     * Given an array of integers, return indices of the two numbers such that they add up to a specific target.
     * You may assume that each input would have exactly one solution, and you may not use the same element twice.
     *
     * Example:
     * Given nums = [2, 7, 11, 15], target = 9,
     * Because nums[0] + nums[1] = 2 + 7 = 9,
     * return [0, 1].
     */

    /*
     * Solution 1: Brute force high time, low space
     * Two loops, which outer loop start from begin to the last second element, inner loop from next element of current i to the end of array, when met the target, return the new build array
     *
     * Time: Get inner j loop as pivot, n represent the length of array, O(n - 1) + O(n - 2) + ... + O(1) = O(n(n + 1)/2) = O(n^2)
     * Space: O(2) new alloc 2 space result array = O(1)
     */
    
    func twoSum_1(_ nums: [Int], _ target: Int) -> [Int] {
        for i in 0..<nums.count {
            for j in i+1 ..< nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
            }
        }
        return [-1, -1]
    }
    
    /*
    * Solution 2: HashMap high space, low time
    *
    * ** if need two indices, map is needed, set is not enough **
    *
    * Use hashMap to record current value pairs with current index, one loop to iterative the array to find rest of number which could add to target or record current number
    *
    * Time: O(n) n represent the length of array
    * Space: O(n) the worst case the when find the result at the end of array or find no result after iterative all the array
    */
    
    func twoSum_2(_ nums: [Int], _ target: Int) -> [Int] {
        var map: [Int : Int] = [:]
        for (index, num) in nums.enumerated() {
            if let find = map[target - num] {
                return [find, index]
            } else {
                map[num] = index
            }
        }
        return [-1, -1]
    }
}
