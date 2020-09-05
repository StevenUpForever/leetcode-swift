//
//  Q709ToLowerCase.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/4/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q709ToLowerCase: NSObject {

    //Difficulty: Easy
    //TAG: Apple
    //TAG: String

    /**
     * 709. To Lower Case
     * Implement function ToLowerCase() that has a string parameter str, and returns the same string in lowercase.
     *
     *
     *
     * Example 1:
     *
     * Input: "Hello"
     * Output: "hello"
     * Example 2:
     *
     * Input: "here"
     * Output: "here"
     * Example 3:
     *
     * Input: "LOVELY"
     * Output: "lovely"
     */
    
    func toLowerCase(_ str: String) -> String {
        return str.lowercased()
    }
}
