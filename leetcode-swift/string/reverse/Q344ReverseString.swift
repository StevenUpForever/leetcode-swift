//
//  Q344ReverseString.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/3/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q344ReverseString: NSObject {

    //Difficulty: Easy
    //TAG: Apple
    //TAG: String

    /**
     * 344. Reverse String
     * Write a function that reverses a string. The input string is given as an array of characters char[].
     *
     * Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
     *
     * You may assume all the characters consist of printable ascii characters.
     *
     *
     *
     * Example 1:
     *
     * Input: ["h","e","l","l","o"]
     * Output: ["o","l","l","e","h"]
     * Example 2:
     *
     * Input: ["H","a","n","n","a","h"]
     * Output: ["h","a","n","n","a","H"]
     */

    /*
    Solution:
    exchange left and right and move them to middle

    Time: O(n/2) = O(n)
    Space: O(1)
     */
    
    func reverseString(_ s: inout [Character]) {
        var start = 0, end = s.count - 1
        while start < end {
            let char1 = s[start]
            s[start] = s[end]
            s[end] = char1
            start += 1
            end -= 1
        }
    }
}
