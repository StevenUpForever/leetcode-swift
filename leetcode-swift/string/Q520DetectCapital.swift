//
//  Q520DetectCapital.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/24/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q520DetectCapital: NSObject {

    /**
     520. Detect Capital
     
     Given a word, you need to judge whether the usage of capitals in it is right or not.

     We define the usage of capitals in a word to be right when one of the following cases holds:

     All letters in this word are capitals, like "USA".
     All letters in this word are not capitals, like "leetcode".
     Only the first letter in this word is capital, like "Google".
     Otherwise, we define that this word doesn't use capitals in a right way.
      

     Example 1:

     Input: "USA"
     Output: True
      

     Example 2:

     Input: "FlaG"
     Output: False
      

     Note: The input will be a non-empty word consisting of uppercase and lowercase latin letters.
     */
    
    /*
     Solution:
     
     Condition simplify to:
     
     if first is upper case:
     then rest of chars can be either upper or lower but need be the same
     
     if first is lower:
     rest must be lower
     
     Time: O(n)
     Space: O(1)
     */

    func detectCapitalUse(_ word: String) -> Bool {
        guard let first = word.first else {
            return true
        }
        let firstUpper = first.isUppercase
        //indicate the second uppercase
        var upper: Bool?
        for (index, char) in word.enumerated() {
            if index == 0 {
                continue
            }
            if upper == nil {
                upper = char.isUppercase
            }
            if let upper = upper {
                if (!firstUpper && char.isUppercase) || upper != char.isUppercase {
                    return false
                }
            }
        }
        return true
    }
}
