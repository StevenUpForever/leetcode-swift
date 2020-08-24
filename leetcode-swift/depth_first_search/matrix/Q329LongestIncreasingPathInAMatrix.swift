//
//  Q329LongestIncreasingPathInAMatrix.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/1/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q329LongestIncreasingPathInAMatrix: NSObject {
    
    /**
     * 329. Longest Increasing Path in a Matrix
     *  Given an integer matrix, find the length of the longest increasing path.
     *
     * From each cell, you can either move to four directions: left, right, up or down. You may NOT move diagonally or move outside of the boundary (i.e. wrap-around is not allowed).
     *
     * Example 1:
     *
     * Input: nums =
     * [
     *   [9,9,4],
     *   [6,6,8],
     *   [2,1,1]
     * ]
     * Output: 4
     * Explanation: The longest increasing path is [1, 2, 6, 9].
     * Example 2:
     *
     * Input: nums =
     * [
     *   [3,4,5],
     *   [3,2,6],
     *   [2,2,1]
     * ]
     * Output: 4
     * Explanation: The longest increasing path is [3, 4, 5, 6]. Moving diagonally is not allowed.
     */

    /*
    Solution:
    DFS find the longest increasing path and update the max

    Time: O(mn*mn)
    Space: O(mn)
     */

    private let directions = [(-1, 0), (0, -1), (1, 0), (0, 1)]
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let row = matrix.count
        guard let col = matrix.first?.count else {
            return 0
        }
        var maxMatrix: [[Int]] = Array(repeating: Array(repeating: 0, count: col), count: row)
        var res = 0
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                res = max(res, dfs(matrix: matrix, maxMatrix: &maxMatrix, pre: Int.min, i: i, j: j))
            }
        }
        return res
    }
    
    private func dfs(matrix: [[Int]], maxMatrix: inout [[Int]], pre: Int, i: Int, j: Int) -> Int {
        let row = matrix.count
        guard let col = matrix.first?.count,
            i >= 0 && i < row,
            j >= 0 && j < col,
            matrix[i][j] > pre else {
            return 0
        }
        if maxMatrix[i][j] != 0 {
            return maxMatrix[i][j]
        }
        var maxLen = 1
        directions.forEach { (dir) in
            maxLen = max(maxLen, 1 + dfs(matrix: matrix, maxMatrix: &maxMatrix, pre: matrix[i][j], i: i + dir.0, j: j + dir.1))
        }
        maxMatrix[i][j] = maxLen
        return maxLen
    }
}
