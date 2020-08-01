//
//  Q46Permutations.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q46Permutations: NSObject {

    //TAG: LinkedIn
    //TAG: Apple
    //TAG: DFS
    //Difficulty: Medium

    /**
     * 46. Q46Permutations
     * Given a collection of distinct numbers, return all possible permutations.

     For example,
     [1,2,3] have the following permutations:
     [
     [1,2,3],
     [1,3,2],
     [2,1,3],
     [2,3,1],
     [3,1,2],
     [3,2,1]
     ]
     */

    /*
     * Approach:
     * recursion problem, swap or add diff char into new list every time, recursion tree as below
     *                         abc
     *                      /   \     \
     *                   a(bc) b(ac) c(ab)
     *               /    |      /  \
     *              ab(c) ac(b)ba(c) bc(a)
     *              /
     *             abc      ......
     */
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var res: [[Int]] = []
        var nums = nums, temp: [Int] = []
//        dfs1(res: &res, arr: &nums, index: 0)
        dfs2(res: &res, arr: &temp, nums: nums)
        return res
    }
    
    /*
    * Solution 1:
    * Have a list which contains all numbers in nums, swap diff pair of chars every time to make diff order of list
    * *** make sure every diff pair chars exchange once and only once ***
    * Base case: when index == nums.len, means swap all pairs for current for loop, add to res
    * recursion rule:
    *      1. for i = current index to the end, swap index and i
    *      2. recursive to index + 1 level
    *      3. reset to previous status
    *
    * Time: O(n!) every recursion level will skip one char in loop so O(n*(n - 1)*(n - 2)) = O(n!)
    * Space: O(n)
    */
    
    private func dfs1(res: inout [[Int]], arr: inout [Int], index: Int) {
        if index == arr.count {
            res.append(Array(arr))
            return
        }
        for i in index ..< arr.count {
            arr.swapAt(i, index)
            dfs1(res: &res, arr: &arr, index: index + 1)
            arr.swapAt(i, index)
        }
    }
    
    /*
    * Solution 2:
    * Have a empty list, and nums in recursion, every time add a new char (not been appear in list), and recursive next level
    * every loop will loop all numbers in nums to current recursion index in list (by list.add() will make index + 1)
    *
    * Time: O(n!^2) by have list.contains()in every level
    * Space: O(n)
    */
    
    private func dfs2(res: inout [[Int]], arr: inout [Int], nums: [Int]) {
        if arr.count == nums.count {
            res.append(Array(arr))
            return
        }
        for i in 0 ..< nums.count {
            if !arr.contains(nums[i]) {
                arr.append(nums[i])
                dfs2(res: &res, arr: &arr, nums: nums)
                arr.removeLast()
            }
        }
    }
}
