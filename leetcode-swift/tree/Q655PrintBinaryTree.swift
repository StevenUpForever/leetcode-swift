//
//  Q655PrintBinaryTree.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/4/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q655PrintBinaryTree: NSObject {

    //Difficulty: medium
    //TAG: Uber
    //TAG: Tree
    //TAG: recursion

    /**
     * 655. Print Binary Tree
     * Print a binary tree in an m*n 2D string array following these rules:
     *
     * The row number m should be equal to the height of the given binary tree.
     * The column number n should always be an odd number.
     * The root node's value (in string format) should be put in the exactly middle of the first row it can be put. The column and the row where the root node belongs will separate the rest space into two parts (left-bottom part and right-bottom part). You should print the left subtree in the left-bottom part and print the right subtree in the right-bottom part. The left-bottom part and the right-bottom part should have the same size. Even if one subtree is none while the other is not, you don't need to print anything for the none subtree but still need to leave the space as large as that for the other subtree. However, if two subtrees are none, then you don't need to leave space for both of them.
     * Each unused space should contain an empty string "".
     * Print the subtrees following the same rules.
     * Example 1:
     * Input:
     *      1
     *     /
     *    2
     * Output:
     * [["", "1", ""],
     *  ["2", "", ""]]
     * Example 2:
     * Input:
     *      1
     *     / \
     *    2   3
     *     \
     *      4
     * Output:
     * [["", "", "", "1", "", "", ""],
     *  ["", "2", "", "", "", "3", ""],
     *  ["", "", "4", "", "", "", ""]]
     * Example 3:
     * Input:
     *       1
     *      / \
     *     2   5
     *    /
     *   3
     *  /
     * 4
     * Output:
     *
     * [["",  "",  "", "",  "", "", "", "1", "",  "",  "",  "",  "", "", ""]
     *  ["",  "",  "", "2", "", "", "", "",  "",  "",  "",  "5", "", "", ""]
     *  ["",  "3", "", "",  "", "", "", "",  "",  "",  "",  "",  "", "", ""]
     *  ["4", "",  "", "",  "", "", "", "",  "",  "",  "",  "",  "", "", ""]]
     * Note: The height of binary tree is in the range of [1, 10].
     */

    /*
    Solution:
    assume h = tree height, get from O(n) post order
    size of every list is 2^n - 1
    prepare for all list in a combined lists

    pre order the tree again, set mid value to root.value and recursion to left and right

    Time: O(logn * n (lists size) + n (get height) + n (dfs)) =  O(nlogn + n)
    Space O(logn * n + n max recursion levels) = O(nlogn + n)
     */
    
    func printTree(_ root: TreeNode?) -> [[String]] {
        let height = getHeight(root)
        let arrSize = Int(pow(Double(2), Double(height))) - 1
        var res = Array(repeating: Array(repeating: "", count: arrSize), count: height)
        updateArr(arr: &res, node: root, index: 0, left: 0, right: arrSize)
        return res
    }
    
    private func getHeight(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = getHeight(root?.left), right = getHeight(root?.right)
        return max(left, right) + 1
    }

    private func updateArr(arr: inout [[String]], node: TreeNode?, index: Int, left: Int, right: Int) {
        if left > right || node == nil {
            return
        }
        let mid = left + (right - left)/2
        arr[index][mid] = String(node!.val)
        updateArr(arr: &arr, node: node?.left, index: index + 1, left: left, right: mid - 1)
        updateArr(arr: &arr, node: node?.right, index: index + 1, left: mid + 1, right: right)
    }
}
