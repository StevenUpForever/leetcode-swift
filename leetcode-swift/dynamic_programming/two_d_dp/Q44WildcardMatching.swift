//
//  Q44WildcardMatching.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/24/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q44WildcardMatching: NSObject {

    //TAG: Google
    //TAG: Facebook
    //TAG: DP

    /**
     * 44. Wildcard Matching
     * Implement wildcard pattern matching with support for '?' and '*'.

     '?' Matches any single character.
     '*' Matches any sequence of characters (including the empty sequence).

     The matching should cover the entire input string (not partial).

     The function prototype should be:
     bool isMatch(const char *s, const char *p)

     Some examples:
     isMatch("aa","a") → false
     isMatch("aa","aa") → true
     isMatch("aaa","aa") → false
     isMatch("aa", "*") → true
     isMatch("aa", "a*") → true
     isMatch("ab", "?*") → true
     isMatch("aab", "c*a*b") → false
     */

    /*
     * Solution:
     * DP problem, 2 dimensional dp problem, set a matrix(s.len + 1, p.len + 1) include which when no characher in s or p
     * Base case: M[0][0] = true, "" and "" matches
     * Induction rule:
     *      1. If p[j] == '*', M[i][j] = M[i - 1][j] || M[i - 1][j - 1] || M[i][j - 1]
     *              A. if '*' == "" M[i][j] = M[i, j - 1], s[i] match p[j] equals s[i] match p[j - 1]
     *              B. if '*' == s[i] or '?' M[i][j] = M[i - 1, j - 1], same as condition 1
     *              C. if '*' == one or more char sequence in s, M[i][j] = M[i - 1, j], due to current '*', M[i - 1][j] also have A B C conditions, which may match M[i - 2][j] recursively M[i - k][j] which '*' matches length k substring in s
     *      2. If s[i] == p[j] || p[j] == '?' M[i][j] = M[i - 1][j - 1]
     *      3. If s[i] != p[j] && p[j] != '?' M[i][j] = false, the last character of current substring s and p will not possible be match
     * return M[row - 1][col - 1]
     *
     * Time: O(mn) which m represent length of s, n represent length of p
     * Space: O(mn) dp matrix
     */
    
    func isMatch(_ s: String, _ p: String) -> Bool {
        let row = s.count, col = p.count
        var dp = Array(repeating: Array(repeating: false, count: col + 1), count: row + 1)
        let arrS = Array(s), arrP = Array(p)
        for indexS in 0 ... row {
            for indexP in 0 ... col {
                if indexS == 0 || indexP == 0 {
                    if indexS == 0 && indexP == 0 {
                        dp[indexS][indexP] = true
                         //When i == 0, and first j characters are '*', dp[i][j] = true, after first p[j] != '*', are false
                    } else if indexS == 0 && arrP[indexP - 1] == "*" {
                        dp[indexS][indexP] = dp[indexS][indexP - 1]
                    }
                } else {
                    if arrP[indexP - 1] == "*" {
                        dp[indexS][indexP] = dp[indexS - 1][indexP] || dp[indexS - 1][indexP - 1] || dp[indexS][indexP - 1]
                    } else if arrS[indexS - 1] == arrP[indexP - 1] || arrP[indexP - 1] == "?" {
                        dp[indexS][indexP] = dp[indexS - 1][indexP - 1]
                    }
                }
            }
        }
        return dp[row][col]
    }
}
