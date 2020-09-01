//
//  Q678ValidParenthesisString.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q678ValidParenthesisString: NSObject {

    //Difficulty: medium
    //TAG: Facebook
    //TAG: stack

    /**
     * 678. Valid Parenthesis String
     * Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:
     *
     * Any left parenthesis '(' must have a corresponding right parenthesis ')'.
     * Any right parenthesis ')' must have a corresponding left parenthesis '('.
     * Left parenthesis '(' must go before the corresponding right parenthesis ')'.
     * '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
     * An empty string is also valid.
     * Example 1:
     * Input: "()"
     * Output: True
     * Example 2:
     * Input: "(*)"
     * Output: True
     * Example 3:
     * Input: "(*))"
     * Output: True
     * Note:
     * The string size will be in the range [1, 100].
     */

    /*
    Solution:

    count star in the string,
    when ) over (, check if we have any stars, if so, decrease one star, if not return false
    other wise pop a (

    finally need check ( stack and * stack, due to if something happen like ***((( this will not be a right case

    Time: O(n)
    Space: O(n)
     */
    
    func checkValidString(_ s: String) -> Bool {
        var stack = [Int]()
        var stars = [Int]()
        for (index, char) in s.enumerated() {
            if char == "(" {
                stack.append(index)
            } else if char == "*" {
                stars.append(index)
            } else {
                let popVal = stack.popLast() ?? stars.popLast()
                if popVal == nil {
                    return false
                }
            }
        }
        while !stack.isEmpty && !stars.isEmpty {
            if stack.popLast() ?? -1 > stars.popLast() ?? -1 {
                return false
            }
        }
        return stack.isEmpty
    }
}
