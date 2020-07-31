//
//  Q523ContinuousSubarraySum.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/29/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q523ContinuousSubarraySum: NSObject {
    //TAG: Facebook
    //TAG: array
    //Difficulty: medium

    /**
     * 523. Continuous Subarray Sum
     * Given a list of non-negative numbers and a target integer k, write a function to check if the array has a continuous subarray of size at least 2 that sums up to the multiple of k, that is, sums up to n*k where n is also an integer.
     *
     * Example 1:
     * Input: [23, 2, 4, 6, 7],  k=6
     * Output: True
     * Explanation: Because [2, 4] is a continuous subarray of size 2 and sums up to 6.
     * Example 2:
     * Input: [23, 2, 6, 4, 7],  k=6
     * Output: True
     * Explanation: Because [23, 2, 6, 4, 7] is an continuous subarray of size 5 and sums up to 42.
     * Note:
     * The length of the array won't exceed 10,000.
     * You may assume the sum of all the numbers is in the range of a signed 32-bit integer.
     */

    /*
    Key point is, any subarray need be multiple of k, so two sum may not the solution for this problem, due to two sum
    will need exact k

    and array of numbers need at least 2
     */

    /*
    Solution 1:
    presum array
    add to a presum array, loop presum array at the same time, find if any subarray sum is multiple of k
    loop the presum array, not 0 to len - 1, but -1 to len - 2, due to new sum itself need check, and if use
    len - 1, sum - presum will be num[i] itself, which not at least 2 numbers

    Time: O(n^2)
    Space: O(n)
     */
    
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        
        let multipleK = { (k: Int, sum: Int) -> Bool in
            let condition1 = k == 0 && sum == 0
            let condition2 = k != 0 && sum % k == 0
            return condition1 || condition2
        }
        
        var sums = [Int]()
        for num in nums {
            let sum = num + (sums.last ?? 0)
            // Need ensure the subarray contains at least two numbers
            for index in -1 ..< sums.count - 1 {
                // j is any subarray sum
                let j = sum - (index < 0 ? 0 : sums[index])
                if multipleK(k, j) && !sums.isEmpty {
                    return true
                }
            }
            sums.append(sum)
        }
        return false
    }
    
    /*
    Solution 2:
    From leetcode
    Key point is: in a presum array, if presum[0, i] % k == presum[0, j] % k, which i < j, that means
    presum[i, j] % k == 0, the mode value must in 0, i scope

    So we could put just mode value in a hashMap, due to not know how many multiple by k, but mode value
    is fixed
    for current sum % k if any mode value is appeared before, means we found i, j just check if j - i > 1

    Time: O(n)
    Space: O(min(n, k))
     */
    
    func checkSubarraySum_2(_ nums: [Int], _ k: Int) -> Bool {
        var sum = 0
        var map: [Int: Int] = [:]
        map[0] = -1
        for (index, num) in nums.enumerated() {
            sum += num
            if k != 0 {
                sum %= k
            }
            if let val = map[sum] {
                if index - val > 1 {
                    return true
                }
            } else {
                map[sum] = index
            }
        }
        return false
    }
}
