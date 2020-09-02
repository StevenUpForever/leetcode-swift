//
//  Q242ValidAnagram.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/1/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q242ValidAnagram: NSObject {

    //TAG: Uber
    //TAG: Apple
    //TAG: map_set
    //TAG: String
    //Difficulty: Easy

    /**
     * 242. Valid Anagram
     * Given two strings s and t, write a function to determine if t is an anagram of s.

     For example,
     s = "anagram", t = "nagaram", return true.
     s = "rat", t = "car", return false.

     Note:
     You may assume the string contains only lowercase alphabets.

     Follow up:
     What if the inputs contain unicode characters? How would you adapt your solution to such case?
     */

    /*
     * Solution:
     * Due to lowercase alphabets, use int[] represent char frequency of str s
     * loop str t, check if any char frequency is currently 0 and will be -1, if so, that char frequency will not match,
     * return false (need check s_length == t_length before)
     * if met the end, return true
     *
     * Time: O(n)
     * Space: O(1) int[26] is O(1)
     */

    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard let comparedValue = Character("a").asciiValue,
            s.count == t.count else {
            return false
        }
        var arr = Array(repeating: 0, count: 26)
        for char in s {
            guard let asciiValue = char.asciiValue else {
                return false
            }
            arr[Int(asciiValue - comparedValue)] += 1
        }
        for char in t {
            guard let asciiValue = char.asciiValue else {
                return false
            }
            let index = Int(asciiValue - comparedValue)
            arr[index] -= 1
            if arr[index] < 0 {
                return false
            }
        }
        return true
    }
}
