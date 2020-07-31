//
//  Q643MaximumAverageSubarrayI.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/30/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q643MaximumAverageSubarrayI: NSObject {
    //Difficulty: easy
    //TAG: Google
    //TAG: array
    //TAG: sliding window

    /**
     * 643. Maximum Average Subarray I
     * Given an array consisting of n integers, find the contiguous subarray of given length k that has the maximum average value. And you need to output the maximum average value.
     *
     * Example 1:
     *
     * Input: [1,12,-5,-6,50,3], k = 4
     * Output: 12.75
     * Explanation: Maximum average is (12-5-6+50)/4 = 51/4 = 12.75
     *
     *
     * Note:
     *
     * 1 <= k <= n <= 30,000.
     * Elements of the given array will be in the range [-10,000, 10,000].
     */

    /*
    Solution:
    Sliding window and find max sum
    finally return max/k

    Time: O(n)
    Space: O(1)
     */
    
    func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
        var maxVal = Int.min
        var sum = 0
        for (index, num) in nums.enumerated() {
            sum += num
            if index >= k {
                sum -= nums[index - k]
            }
            if index >= k - 1 {
                maxVal = max(maxVal, sum)
            }
        }
        return Double(maxVal) / Double(k)
    }
}
