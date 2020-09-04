//
//  Q345ReverseVowelsOfAString.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/3/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q345ReverseVowelsOfAString: NSObject {

    //TAG: Google
    //TAG: string
    //Difficulty: Easy

    /**
     * 345. Reverse Vowels of a String
     * Write a function that takes a string as input and reverse only the vowels of a string.

     Example 1:
     Given s = "hello", return "holle".

     Example 2:
     Given s = "leetcode", return "leotcede".

     Note:
     The vowels does not include the letter "y".
     */

    /**
     * Solution:
     * *** Similar to rainbow sort (sort array contains -1, 0, 1 so that put -1 at left and 1 at right) ***
     * set left and right index, if all met vowels, swap and move both left and right to middle
     * else if left met vowels, wait right to met vowels
     * else if right met vowels or any haven't met vowels, move left
     *
     * Time: O(n)
     * Space: O(1)
     */
    
    func reverseVowels(_ s: String) -> String {
        var arr = Array(s)
        let vowels: Set<Character> = Set(["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"])
        var start = 0, end = arr.count - 1
        while start < end {
            let char1 = arr[start], char2 = arr[end]
            if vowels.contains(char1) && vowels.contains(char2) {
                arr[start] = char2
                arr[end] = char1
                start += 1
                end -= 1
            } else if vowels.contains(char1) {
                end -= 1
            } else if vowels.contains(char2) {
                start += 1
            } else {
                start += 1
                end -= 1
            }
        }
        return String(arr)
    }
}
