//
//  DecodeWays.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/24/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q91DecodeWays: NSObject {

    //TAG: Facebook
    //TAG: Uber
    //TAG: DFS
    //TAG: DP
    //Difficulty: Medium

    /**
     * 91. Decode Ways
     * A message containing letters from A-Z is being encoded to numbers using the following mapping:

     'A' -> 1
     'B' -> 2
     ...
     'Z' -> 26
     Given an encoded message containing digits, determine the total number of ways to decode it.

     For example,
     Given encoded message "12", it could be decoded as "AB" (1 2) or "L" (12).

     The number of ways decoding "12" is 2.
     */

    /*
     * Solution 1: permutation
     * Permutation all possible combinations of the string s, recursion tree like
     *              1234
     *           /        \
     *         A234      L34
     *        /   \      / \
     *      AB34 AW4   LC4 no-more
     *      ......
     * count all possible combinations and return the count
     *
     * Time: O(2^n)
     * Space: O(n) recursion tree levels
     */

    /*
     * Solution 2: DP
     * M[i] represent the max decode ways for substring to i (due to number, from back then start)
     * Base case:
     *      M[len] = 1 (initial step)
     *      M[len -1] = s[len - 1] == '0' ? 1 : 0 (if first char is '0' no matched character, otherwise 1 - 9 is A - I)
     * Induction rule:
     *      if s[i + 1] + s[i + 2] > 26, there's only one way to separate it, so M[i] = M[i + 1]
     *      otherwise have two conditions,
     *          when treat s[i + 1] + s[i + 2] as one part, it's same as > 26, M[i] = M[i + 1]
     *          when separate to two parts, treat M[i + 1] as the one part, so use M[i + 2], so use M[i + 1] + M[i + 2]
     *
     * Time: O(n)
     * Space: O(n)
     */
    
    func numDecodings(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var dp = Array(repeating: 0, count: s.count + 1)
        dp[s.count] = 1
        dp[s.count - 1] = s[s.index(before: s.endIndex)] == "0" ? 0 : 1
        // Cannot check if s.index(s.endIndex, offsetBy: -2) < 0 otherwise will throw fatal error directly
        if s.distance(from: s.startIndex, to: s.endIndex) < 2 {
            return dp[0]
        }
        var index = s.index(s.endIndex, offsetBy: -2)
        while index >= s.startIndex {
            if s[index] != "0" {
                if let firstDigit = Int(String(s[index])),
                    let secondDigit = Int(String(s[s.index(after: index)])) {
                    let intIndex = s.distance(from: s.startIndex, to: index)
                    dp[intIndex] = firstDigit * 10 + secondDigit <= 26
                        ? dp[intIndex + 1] + dp[intIndex + 2]
                        : dp[intIndex + 1]
                }
            }
            if index == s.startIndex {
                break
            }
            index = s.index(before: index)
        }
        return dp[0]
    }
}
