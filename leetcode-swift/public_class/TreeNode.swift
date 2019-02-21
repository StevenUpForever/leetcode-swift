//
//  TreeNode.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class TreeNode: NSObject {
    
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }

}
