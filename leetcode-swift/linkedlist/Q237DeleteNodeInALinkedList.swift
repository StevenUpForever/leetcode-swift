//
//  Q237DeleteNodeInALinkedList.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q237DeleteNodeInALinkedList: NSObject {

    //TAG: Microsoft
    //TAG: Apple
    //TAG: linked list
    //Difficulty: Easy

    /**
     * 237. Delete Node in a Linked List
     * Write a function to delete a node (except the tail) in a singly linked list, given only access to that node.

     Supposed the linked list is 1 -> 2 -> 3 -> 4 and you are given the third node with value 3, the linked list should become 1 -> 2 -> 4 after calling your function.
     */
    
    func deleteNode(_ node: ListNode?) {
        var node = node
        while node?.next != nil {
            node?.val = node?.next?.val ?? 0
            if node?.next?.next == nil {
                node?.next = nil
            } else {
                node = node?.next
            }
        }
    }
}
