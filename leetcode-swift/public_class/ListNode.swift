//
//  ListNode.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
