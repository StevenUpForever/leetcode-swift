//
//  Q14LongestCommonPrefix.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/28/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q14LongestCommonPrefix: NSObject {
    
    //Difficulty: easy
    //TAG: Google
    //TAG: Apple
    //TAG: array

    /**
     * 14. Longest Common Prefix
     * Write a function to find the longest common prefix string amongst an array of strings.
     */

    /*
     * Solution:
     * Keep result variable, index variable, iterative each string in array
     *      1. get the character from the first string
     *      2. consider some corner cases
     *          1. if index is over any string's length, return current result
     *          2. if current index character from any string is not equal to this local compare character, return the current character
     *      3. After finally met any conditions from step 2, worst case when all string the same length and same character sets, return final result
     *
     * Time: O(n) n represent the total length from all the strings in the array
     * Space: O(min(len(0) ... len(end))) worst case is when all strings are same length and character sets
     */
    
    
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first, !first.isEmpty else {
            return ""
        }
        var res = ""
        var index = first.startIndex
        while index < first.endIndex {
            let char = first[index]
            for str in strs {
                if index >= str.endIndex || str[index] != char {
                    return res
                }
            }
            res.append(char)
            index = first.index(after: index)
        }
        return res
    }
}
