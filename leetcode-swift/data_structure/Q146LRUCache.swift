//
//  Q146LRUCache.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q146LRUCache: NSObject {
    
    //TAG: Google
    //TAG: Facebook
    //TAG: Microsoft
    //TAG: Amazon
    //TAG: Uber
    //TAG: Snap
    //TAG: Apple
    //TAG: Data structure
    //Difficulty: Hard

    /**
    146. LRU Cache
     Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

     get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
     put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

     Follow up:
     Could you do both operations in O(1) time complexity?

     Example:

     Q146LRUCache cache = new Q146LRUCache( 2  capacity );
    cache.put(1, 1);
    cache.put(2, 2);
    cache.get(1);       // returns 1
    cache.put(3, 3);    // evicts key 2
    cache.get(2);       // returns -1 (not found)
    cache.put(4, 4);    // evicts key 1
    cache.get(1);       // returns -1 (not found)
    cache.get(3);       // returns 3
    cache.get(4);       // returns 4
    */

    /*
     * Solution:
     *
     * Use Doubly linkedList, used when delete LRU and insert
     * Use HashMap for get O(1)
     */
    
    class LRUCache {
        
        private var map: [Int: DoubleNode] = [:]
        private let head: DoubleNode
        private let tail: DoubleNode
        private var capacity: Int

        init(_ capacity: Int) {
            head = DoubleNode(key: 0, val: 0)
            tail = DoubleNode(key: 0, val: 0)
            head.next = tail
            tail.pre = head
            self.capacity = capacity
        }
        
        func get(_ key: Int) -> Int {
            // If contains such node, delete and insert at the first place
            if let node = map[key] {
                deleteNode(node: node)
                insertInFront(node: node)
                return node.val
            }
            return -1
        }
        
        func put(_ key: Int, _ value: Int) {
            // If there's exist node associated with the key and need replace
            if let node = map[key] {
                deleteNode(node: node)
                // Adjust capacity when deleting old node, otherwise replace node will reduce capacity in error from line 89
                capacity += 1
            }
            let newNode = DoubleNode(key: key, val: value)
            map[key] = newNode
            insertInFront(node: newNode)
            capacity -= 1
            if capacity < 0 {
                // Make sure tail.pre !== head
                guard let pre = tail.pre, pre !== head else {
                    return
                }
                deleteNode(node: pre)
                map.removeValue(forKey: pre.key)
                capacity += 1
            }
        }
        
        private func insertInFront(node: DoubleNode) {
            let next = head.next
            head.next = node
            node.pre = head
            node.next = next
            next?.pre = node
        }
        
        private func deleteNode(node: DoubleNode) {
            node.pre?.next = node.next
            node.next?.pre = node.pre
        }
    }
    
    class DoubleNode {
        var pre: DoubleNode?
        var next: DoubleNode?
        var key: Int
        var val: Int
        init(key: Int, val: Int) {
            self.key = key
            self.val = val
        }
    }

}
