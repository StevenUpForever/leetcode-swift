//
//  Q567PermutationInString.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/3/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q567PermutationInString: NSObject {

    //Difficulty: Medium
    //TAG: Facebook
    //TAG: String
    //TAG: Sliding window

    /**
     * 567. Permutation in String
     * Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1.
     * In other words, one of the first string's permutations is the substring of the second string.
     *
     *
     *
     * Example 1:
     *
     * Input: s1 = "ab" s2 = "eidbaooo"
     * Output: True
     * Explanation: s2 contains one permutation of s1 ("ba").
     * Example 2:
     *
     * Input:s1= "ab" s2 = "eidboaoo"
     * Output: False
     *
     *
     * Note:
     *
     * The input strings only contain lower case letters.
     * The length of both given strings is in range [1, 10,000].
     */

    /*
    Solution:

    sliding window filter by map

    Time: O(m + n)
    Space: O(m)
     */
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        if s1.count > s2.count {
            return false
        }
        var map = [Character: Int]()
        for c in s1 {
            map[c] = (map[c] ?? 0) + 1
        }
        var count = map.count, i = 0
        let arr = Array(s2)
        for j in 0 ..< arr.count {
            if let val = map[arr[j]] {
                map[arr[j]] = val - 1
                if val == 1 {
                    count -= 1
                }
            }
            if j >= s1.count {
                if let val = map[arr[i]] {
                    map[arr[i]] = val + 1
                    if val == 0 {
                        count += 1
                    }
                }
                i += 1
            }
            if count == 0 {
                return true
            }
        }
        return false
    }

    /*
    Solution 2:
    sliding window, filter by int[26]

    Time: O(m + n)
    Space: O(1)
     */

    func checkInclusion2(_ s1: String, _ s2: String) -> Bool {
        if s2.count < s1.count { return false }
        var map: [Character : Int] = [ : ]
        let s1 = Array(s1), s2 = Array(s2), len = s1.count
        var matchArr = Array(repeating:0, count:26)
        var runningArr = Array(repeating:0, count:26)
        for (i,c) in "abcdefghijklmnopqrstuvwxyz".enumerated() {
            map[c] = i
        }
        for i in 0..<s1.count {
            matchArr[map[s1[i]]!] += 1
            runningArr[map[s2[i]]!] += 1
        }
        if matchArr == runningArr { return true }
        // Compare from s1.length to save time
        for i in len..<s2.count {
            runningArr[map[s2[i]]!] += 1
            runningArr[map[s2[i-len]]!] -= 1
            if matchArr == runningArr { return true }
        }
        return false
    }
}
