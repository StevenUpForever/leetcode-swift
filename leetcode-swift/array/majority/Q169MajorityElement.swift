//
//  Q169MajorityElement.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/28/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q169MajorityElement: NSObject {

    //Difficulty: Easy
    //TAG: Google
    //TAG: array

    /**
     * 169. Majority Element
     * Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.
     *
     * You may assume that the array is non-empty and the majority element always exist in the array.
     *
     * Example 1:
     *
     * Input: [3,2,3]
     * Output: 3
     * Example 2:
     *
     * Input: [2,2,1,1,1,2,2]
     * Output: 2
     */

    /*
    Solution:
    Save a num as nums[0] assume it's the one > 1/2, then when met the same count++
    when different count--, when count == 0 reassign num = nums[i]

    finally the num must be the one > 1/2, if there exist one

    Time: O(n)
    Space: O(1)
     */
    
    func majorityElement(_ nums: [Int]) -> Int {
        guard var res = nums.first else {
            return -1
        }
        var count = 1
        nums.forEach { (num) in
            if res == num {
                count += 1
            } else {
                count -= 1
                if count == 0 {
                    res = num
                    count = 1
                }
            }
        }
        return res
    }
}
