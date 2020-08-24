//
//  Q17LetterCombinationsOfAPhoneNumber.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/24/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q17LetterCombinationsOfAPhoneNumber: NSObject {

    //TAG: Facebook
    //TAG: Google
    //TAG: Uber
    //TAG: Amazon
    //TAG: Apple
    //TAG: DFS
    //Difficulty: Medium

    /**
     * 17. Letter Combinations of a Phone Number
     * Given a digit string, return all possible letter combinations that the number could represent.

     A mapping of digit to letters (just like on the telephone buttons) is given below.



     Input:Digit string "23"
     Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
     Note:
     Although the above answer is in lexicographical order, your answer could be in any order you want.
     */

    /*
     * Solution:
     * Begin recursion from the first string, in the loop, recursion next strings related to input digit array related strings
     * recursion tree like below, if input is 23
     *              abc
     *         /    \      \
     *        a     b       c
     *      / \ \ / | \
     *     d  e f d  e f ...
     *
     *     Time: O(m^n) m is string length, n is digit length
     *     Space: O(n)
     */

    private let pad = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
    
    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }
        var res = [String]()
        dfs(res: &res, cur: "", digits: digits, index: digits.startIndex)
        return res
    }

    private func dfs(res: inout [String], cur: String, digits: String, index: String.Index) {
        if index == digits.endIndex {
            res.append(cur)
            return
        }
        let str = digits[index..<digits.index(after: index)]
        if let padIndex = Int(str) {
            let padStr = pad[padIndex]
            for char in padStr {
                dfs(res: &res, cur: cur + String(char), digits: digits, index: digits.index(after: index))
            }
        }
    }
}
