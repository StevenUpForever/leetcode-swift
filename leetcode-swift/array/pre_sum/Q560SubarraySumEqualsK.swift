//
//  Q560SubarraySumEqualsK.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class Q560SubarraySumEqualsK: NSObject {
    
    //Difficulty: Medium
    //TAG: Snap
    //TAG: presum
    //TAG: array
    
    /**
     * 560. Subarray Sum Equals K
     * Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
     *
     * Example 1:
     * Input:nums = [1,1,1], k = 2
     * Output: 2
     * Note:
     * The length of the array is in range [1, 20,000].
     * The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].
     */
    
    /*
     Solution:
     Use presum array to quick filter subarray sum, use two sum to quick find designated subarray sum
     
     Time: O(n)
     Space: O(n)
     */
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0, map = [Int: Int](), count = 0
        map[0] = 1
        for num in nums {
            sum += num
            count += map[sum - k] ?? 0
            map[sum] = (map[sum] ?? 0) + 1
        }
        return count
    }

}
