//
//  Q102BinaryTreeLevelOrderTraversal.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q102BinaryTreeLevelOrderTraversal: NSObject {

    //TAG: LinkedIn
    //TAG: Tree
    //TAG: Breadth first search
    //Difficulty: Medium

    /**
     * 102. Binary Tree Level Order Traversal
     * Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

     For example:
     Given binary tree [3,9,20,null,null,15,7],
     3
     / \
     9  20
     /  \
     15   7
     return its level order traversal as:
     [
     [3],
     [9,20],
     [15,7]
     ]
     */

    /**
     * Solution 1:
     * Use a FIFO structure (queue) to push and pop numbers, the push order will be left -> right, then pop order is left -> right too
     * for every time, record a current length of current queue (which is the length of nodes on current level), add them to a list and begin next loop
     *
     * Time: O(n)
     * Space: O(n)
     */
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res: [[Int]] = []
        guard let root = root else {
            return res
        }
        var queue: [TreeNode?] = []
        queue.append(root)
        while !queue.isEmpty {
            let size = queue.count
            var arr: [Int] = []
            for _ in 0 ..< size {
                guard let curNode = queue.removeFirst() else {
                    break
                }
                arr.append(curNode.val)
                if let left = curNode.left {
                    queue.append(left)
                }
                if let right = curNode.right {
                    queue.append(right)
                }
            }
            res.append(arr)
        }
        return res
    }
}
