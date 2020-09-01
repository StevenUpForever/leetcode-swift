//
//  Q2AddTwoNumbers.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q2AddTwoNumbers: NSObject {

    //TAG: Microsoft
    //TAG: Amazon
    //TAG: Airbnb
    //TAG: Apple
    //TAG: linked list
    //Difficulty: Medium

    /**
     * 2. Add Two Numbers
     * You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
     You may assume the two numbers do not contain any leading zero, except the number 0 itself.

     Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
     Output: 7 -> 0 -> 8
     */

    /*
     * Solution:
     * The order of list represent the number from lower level to higher level, either choose add number one by one or parse lists to two numbers and add them are the same
     * add number by each bit
     * 1. keep a carry at the same time
     * 2. be aware of the post step of longer part of the longer list
     * 3. be aware of when addition is done and carray is still > 0 then need to add new listNode at the end of result list
     *
     * Time: O(m + n) m, n represent length of l1 and l2
     * Space: O(Math.max(m, n)) alloc a new list to save the addition result, which the length of result is the within [max(m, n), max(m, n) + 1]
     */
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var dummy: ListNode? = ListNode(0), res = dummy
        var l1 = l1, l2 = l2
        var carry = 0
        while l1 != nil || l2 != nil {
            let val1 = l1?.val ?? 0
            let val2 = l2?.val ?? 0
            let sum = val1 + val2 + carry
            dummy?.next = ListNode(sum % 10)
            carry = sum / 10
            dummy = dummy?.next
            l1 = l1?.next
            l2 = l2?.next
        }
        if carry > 0 {
            dummy?.next = ListNode(carry)
        }
        return res?.next
    }
}
