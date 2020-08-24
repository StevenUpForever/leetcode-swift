//
//  Q39CombinationSum.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/24/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q39CombinationSum: NSObject {

    //TAG: Uber
    //TAG: Airbnb
    //TAG: Apple
    //TAG: DFS
    //TAG: 99 cents
    //Difficulty: Medium

    /**
     * 39. Combination Sum
     * Given a set of candidate numbers (C) (without duplicates) and a target number (T), find all unique combinations in C where the candidate numbers sums to T.

     The same repeated number may be chosen from C unlimited number of times.

     Note:
     All numbers (including target) will be positive integers.
     The solution set must not contain duplicate combinations.
     For example, given candidate set [2, 3, 6, 7] and target 7,
     A solution set is:
     [
     [7],
     [2, 2, 3]
     ]
     */

    /*
     * Solution: recursion
     * recursion step:
     *      Base case: when the value is equal to target or smaller but add one more current value will over target, then return
     *      recursion rule:
     *          keep track of current rest of value (target - current added)
     *          try to add different numbers of current value into current value, better from large to small values
     * recursion tree:
     *                               ""
     *                  / / / / /       \ \ \ \
     * candidates[0] * 1 2 3  4 5  ......        <= target
     *                   / / / / /       \ \ \ \
     * candidates[1] * 1 2 3  4 5  ......        <= target
     *              ......
     * candidates[len - 1] * 1 2 3  4 5  ......  <= target
     *
     * Time: O(m ^ n)
     *      m represent the max count needed which is target/candidates[0] (smallest value)
     *      n represent the length of candidates array
     * Space: O(m)
     *      m represent the max count needed which is target/candidates[0] (smallest value), also as the max levels of recursion tree
     */
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]](), countArr = [Int]()
        dfs(candidates: candidates, countArr: &countArr, res: &res, target: target, index: 0)
        return res
    }

    private func dfs(candidates: [Int], countArr: inout [Int], res: inout [[Int]], target: Int, index: Int) {
        if target < 0 {
            return
        }
        if index == candidates.count {
            if target == 0 {
                var arr = [Int]()
                for (index, count) in countArr.enumerated() {
                    arr.append(contentsOf: Array(repeating: candidates[index], count: count))
                }
                res.append(arr)
            }
            return
        }
        for i in 0 ... target/candidates[index] {
            countArr.append(i)
            dfs(candidates: candidates, countArr: &countArr, res: &res, target: target - candidates[index] * i, index: index + 1)
            countArr.removeLast()
        }
    }

}
