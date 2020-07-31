//
//  Q189RotateArray.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/30/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q189RotateArray: NSObject {
    //Difficulty: easy
    //TAG: Uber
    //TAG: array

    /**
     * 189. Rotate Array
     * Given an array, rotate the array to the right by k steps, where k is non-negative.
     *
     * Example 1:
     *
     * Input: [1,2,3,4,5,6,7] and k = 3
     * Output: [5,6,7,1,2,3,4]
     * Explanation:
     * rotate 1 steps to the right: [7,1,2,3,4,5,6]
     * rotate 2 steps to the right: [6,7,1,2,3,4,5]
     * rotate 3 steps to the right: [5,6,7,1,2,3,4]
     * Example 2:
     *
     * Input: [-1,-100,3,99] and k = 2
     * Output: [3,99,-1,-100]
     * Explanation:
     * rotate 1 steps to the right: [99,-1,-100,3]
     * rotate 2 steps to the right: [3,99,-1,-100]
     * Note:
     *
     * Try to come up as many solutions as you can, there are at least 3 different ways to solve this problem.
     * Could you do it in-place with O(1) extra space?
     */

    /*
    Solution:
    make k as pivot
    1. swap [0, k - 1]
    2. swap [k, len - 1]
    3. swap [0, len - 1]

    if first swap the whole array, then actually next need revert first k elements
    1. swap [0, len - 1]
    1. swap [0, k]
    2. swap [k + 1, len - 1]

    Time: O(n)
    Space: O(1)
     */
    
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        rotateByRange(&nums, 0, nums.count - 1)
        rotateByRange(&nums, 0, k - 1)
        rotateByRange(&nums, k, nums.count - 1)
    }
    
    private func rotateByRange(_ nums: inout [Int], _ start: Int, _ end: Int) {
        var start = start
        var end = end
        while start < end {
            let temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
}
