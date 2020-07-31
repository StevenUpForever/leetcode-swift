//
//  Q347TopKFrequentElements.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/30/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q347TopKFrequentElements: NSObject {

    /**
     * 347. Top K Frequent Elements
     * Given a non-empty array of integers, return the k most frequent elements.
     *
     * Example 1:
     *
     * Input: nums = [1,1,1,2,2,3], k = 2
     * Output: [1,2]
     * Example 2:
     *
     * Input: nums = [1], k = 1
     * Output: [1]
     * Note:
     *
     * You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
     * Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
     */

    /*
    Solution:
    Swift doesn't have priority queue, so transform the nums to frequency map, sort by frequency (values), at last extract first min(map.count, k) keys.

    Time: O(n + nlogn + k)
    Space: O(n)
     */
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        let map = nums.reduce(into: [:]) { (map, num) in
            map[num, default: 0] += 1
        }
        let elms = map.sorted { (elm1, elm2) -> Bool in
            elm2.value < elm1.value
        }
        return elms.prefix(min(map.count, k)).map { $0.key }
    }
}
