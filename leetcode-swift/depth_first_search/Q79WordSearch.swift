//
//  Q79WordSearch.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class Q79WordSearch: NSObject {
    
    //Difficulty: medium
    //TAG: Apple
    //TAG: Snap
    //TAG: dfs
    
    /**
     * 79. Word Search
     * Given a 2D board and a word, find if the word exists in the grid.
     
     The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
     
     For example,
     Given board =
     
     [
     ['A','B','C','E'],
     ['S','F','C','S'],
     ['A','D','E','E']
     ]
     word = "ABCCED", -> returns true,
     word = "SEE", -> returns true,
     word = "ABCB", -> returns false.
     */
    
    /*
     * Solution:
     * Depends on solution 1, all elements in this problem in matrix are from 'A' to 'Z', which we could modify the original matrix value to a non 'A' - 'Z'
     *
     * Time: O(4^max(m, n))
     * Space: O(1)
     */
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let row = board.count, col = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
        for i in 0 ..< board.count {
            for j in 0 ..< board[i].count {
                if board[i][j] == word.first {
                    if dfs(board, word: word, index: word.startIndex, visited: &visited, i: i, j: j) { return true }
                }
            }
        }
        return false
    }
    
    private func dfs(_ board: [[Character]], word: String, index: String.Index,
                     visited: inout [[Bool]], i: Int, j: Int) -> Bool {
        if index == word.endIndex { return true }
        if i < 0 || i >= board.count || j < 0 || j >= board[i].count ||
            board[i][j] != word[index] || visited[i][j] { return false }
        visited[i][j] = true
        if dfs(board, word: word, index: word.index(after: index), visited: &visited, i: i + 1, j: j) ||
        dfs(board, word: word, index: word.index(after: index), visited: &visited, i: i - 1, j: j) ||
        dfs(board, word: word, index: word.index(after: index), visited: &visited, i: i, j: j + 1) ||
            dfs(board, word: word, index: word.index(after: index), visited: &visited, i: i, j: j - 1) {
            return true
        }
        visited[i][j] = false
        return false
    }

}
