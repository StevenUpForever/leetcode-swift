//
//  Q278FirstBadVersion.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/30/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q278FirstBadVersion: NSObject {
    //Difficulty: Easy
    //TAG: Facebook
    //TAG: Binary search

    /**
     * 278. First Bad Version
     * You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.
     *
     * Suppose you have n versions [1, 2, ..., n] and you want to find out the first bad one, which causes all the following ones to be bad.
     *
     * You are given an API bool isBadVersion(version) which will return whether version is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.
     */

    /*
     * Solution:
     * 1 - n is continuous number which in ascending order, use binary search will be fast and reduce API call
     * It's find the first occurrence number problem, so when isBadVersion need move right = mid, which
     * when left two numbers, check from left to right
     *
     * Time: O(logn)
     * Space: O(1)
     */
    
    func firstBadVersion(_ n: Int) -> Int {
        var left = 1, right = n
        while left < right {
            let mid = left + (right - left) / 2
            if isBadVersion(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return isBadVersion(right) ? right : left
    }

    func isBadVersion(_ version: Int) -> Bool {
        return true
    }
}
