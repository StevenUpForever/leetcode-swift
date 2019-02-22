//
//  Q236LowestCommonAncestorOfABinaryTree.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class Q236LowestCommonAncestorOfABinaryTree: NSObject {
    
    //TAG: Facebook
    //TAG: Microsoft
    //TAG: Amazon
    //TAG: LinkedIn
    //TAG: Apple
    //TAG: Tree
    //TAG: Bottom up
    //Difficulty: Medium
    
    /**
     * 236. Lowest Common Ancestor of a Binary Tree
     * Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
     
     According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes v and w as the lowest node in T that has both v and w as descendants (where we allow a node to be a descendant of itself).”
     
     _______3______
     /              \
     ___5__          ___1__
     /      \        /      \
     6      _2       0       8
     /  \
     7   4
     For example, the lowest common ancestor (LCA) of nodes 5 and 1 is 3. Another example is LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
     */
    
    /*
     * Solution:
     * Classic back track problem
     * What to know at this node: the LCA from left node and right node
     * Report to upper level: LCA from this node
     *
     * Time: O(n) visit every node once
     * Space: O(n) if not balanced
     */
    
    func lowestCommonAncestor(_ root: TreeNode, _ p: TreeNode, _ q: TreeNode) -> TreeNode {
        var mutableRoot: TreeNode? = root
        return lowestCommonAncestorHelper(&mutableRoot, p, q)!
    }
    
    private func lowestCommonAncestorHelper(_ root: inout TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
        if root == nil || root === p || root === q { return root }
        var left = root?.left, right = root?.right
        let leftRes = lowestCommonAncestorHelper(&left, p, q)
        let rightRes = lowestCommonAncestorHelper(&right, p, q)
        if let _ = leftRes, let _ = rightRes {
            return root
        } else { return leftRes ?? rightRes }
    }

}
