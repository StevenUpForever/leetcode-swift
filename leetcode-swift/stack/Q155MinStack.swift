//
//  Q155MinStack.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 8/31/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q155MinStack: NSObject {

    //TAG: Google
    //TAG: Uber
    //TAG: Apple
    //TAG: Stack
    //Difficulty: Easy

    /**
     * 155. Min Stack
     * Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

     push(x) -- Push element x onto stack.
     pop() -- Removes the element on top of the stack.
     top() -- Get the top element.
     getMin() -- Retrieve the minimum element in the stack.
     Example:
     stack.Q155MinStack minStack = new stack.Q155MinStack();
     minStack.push(-2);
     minStack.push(0);
     minStack.push(-3);
     minStack.getMin();   --> Returns -3.
     minStack.pop();
     minStack.top();      --> Returns 0.
     minStack.getMin();   --> Returns -2.

     * Your stack.Q155MinStack object will be instantiated and called as such:
     * stack.Q155MinStack obj = new stack.Q155MinStack();
     * obj.push(x);
     * obj.pop();
     * int param_3 = obj.top();
     * int param_4 = obj.getMin();
     */

    /*
     * Solution:
     * Use two stacks, one stack with regular push and pop, the other stack, when current push value is smaller than
     * stack2.peek(), push, when stack1 pop and it's the value of stack2.peek() too, pop from stack2, so that stack2
     * will keep have the min value of current stack1
     *
     * Time: O(n)
     * Space: O(n) extra stack2
     */
    
    class MinStack {
        
        private var stack1: [Int]
        private var stack2: [Int]

        /** initialize your data structure here. */
        init() {
            stack1 = []
            stack2 = []
        }
        
        func push(_ x: Int) {
            stack1.append(x)
            if stack2.isEmpty || (stack2.last ?? x) >= x {
                stack2.append(x)
            }
        }
        
        func pop() {
            if let last = stack1.popLast(), last == stack2.last {
                _ = stack2.popLast()
            }
        }
        
        func top() -> Int {
            return stack1.last ?? -1
        }
        
        func getMin() -> Int {
            return stack2.last ?? -1
        }
    }
}
