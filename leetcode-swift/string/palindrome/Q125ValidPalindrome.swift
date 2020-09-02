//
//  Q125ValidPalindrome.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/2/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q125ValidPalindrome: NSObject {

    //TAG: Facebook
    //TAG: Microsoft
    //TAG: Uber
    //TAG: String
    //TAG: Palindrome
    //Difficulty: Easy

    /**
     * 125. Valid Palindrome
     * Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.

     For example,
     "A man, a plan, a canal: Panama" is a palindrome.
     "race a car" is not a palindrome.

     Note:
     Have you consider that the string might be empty? This is a good question to ask during an interview.

     For the purpose of this problem, we define empty string as valid palindrome.
     */

    /*
     * Solution:
     * Time: O(n)
     * Space: O(1)
     */
    
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var start = s.startIndex, end = s.index(before: s.endIndex)
        while start < end {
            let char1 = s[start], char2 = s[end]
            guard char1.isLetter || char1.isNumber else {
                start = s.index(after: start)
                continue
            }
            guard char2.isLetter || char2.isNumber else {
                end = s.index(before: end)
                continue
            }
            if s[start].lowercased() != s[end].lowercased() {
                return false
            }
            start = s.index(after: start)
            end = s.index(before: end)
        }
        return start >= end
    }
}
