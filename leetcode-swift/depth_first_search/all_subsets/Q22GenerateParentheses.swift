//
//  Q22GenerateParentheses.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class Q22GenerateParentheses: NSObject {
    
    //TAG: Google
    //TAG: Uber
    //TAG: Snap
    //TAG: Apple
    //TAG: DFS
    //Difficulty: Medium
    
    /**
     * 22. Generate Parentheses
     * Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
     
     For example, given n = 3, a solution set is:
     
     [
     "((()))",
     "(()())",
     "(())()",
     "()(())",
     "()()()"
     ]
     */
    
    /*
     * Solution:
     * Permutations/subsets better use recursion
     * for example, when n == 3, the recursion tree is as below
     *              ""
     *             /  \
     *            (   not valid
     *           / \
     *          (   ) (0 '(' left)
     *         / \
     *        (  ) (1 '(' left)
     *       /  / \
     *      (  (  ) (0 '(' left)
     *     /
     *    )
     *   /
     *  )       ......
     * /
     *)
     * Base case: when number of added '(' and ')' is n * 2, add current parentheses string
     * recursion rule:
     * 1. 1st recursion no matter how many the ( and ) is, if ( is less than n, add (
     * 2. 2st recursion only if ) is less than ( (of course less than n too), add )
     *
     * Time: O(2^n)
     * Space: O(2n) = O(n) most recursion steps, to combine one string as 2n length
     */
    
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        dfs(n, l: 0, r: 0, str: "", strs: &res)
        return res
    }
    
    private func dfs(_ n: Int, l: Int, r: Int, str: String, strs: inout [String]) {
        if (l == n && r == n) {
            strs.append(str)
            return
        }
        if l < n {
            dfs(n, l: l + 1, r: r, str: str + "(", strs: &strs)
        }
        if r < l {
            dfs(n, l: l, r: r + 1, str: str + ")", strs: &strs)
        }
    }

}
