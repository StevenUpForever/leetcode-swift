//
//  Q76MinimumWindowSubstring.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/3/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q76MinimumWindowSubstring: NSObject {

    //Difficulty: Hard
    //TAG: Facebook
    //TAG: Uber
    //TAG: LinkedIn
    //TAG: Airbnb
    //TAG: Apple
    //TAG: String
    //TAG: Sliding window

    /**
     * 76. Minimum Window Substring
     *
     * Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

     For example,
     S = "ADOBECODEBANC"
     T = "ABC"
     Minimum window is "BANC".

     Note:
     If there is no such window in S that covers all characters in T, return the empty string "".

     If there are multiple such windows, you are guaranteed that there will always be only one unique minimum window in S.
     */

    /*
     * Solution:
     * Sliding window problem
     * Keep a global min length
     * Keep a sliding window length of t, keep record the characters occurrence, increase right side of window, when all characters appeared in the window, keep update the global min length
     * Move left side while all characters appear at least once in the window, keep updating the global min
     *      if some characters out of window, move right until new same character in the window
     *
     * Time: O(2n) left + right = O(n)
     * Space: O()
     */
    
    func minWindow(_ s: String, _ t: String) -> String {
        var map = [Character: Int]()
        for char in t {
            map[char] = (map[char] ?? 0) + 1
        }
        let arr = Array(s)
        var count = map.count, right = 0, left = 0, tempLeft = 0, len = Int.max
        for i in 0 ..< arr.count {
            let curChar = arr[i]
            if let val = map[curChar] {
                map[curChar] = val - 1
                if val - 1 == 0 {
                    count -= 1
                }
            }
            while count == 0 {
                // Update minimum length and left/right before move tempLeft, to avoid impact from tempLeft went over the first valid char, that makes count > 0
                if i - tempLeft + 1 < len {
                    len = i - tempLeft + 1
                    left = tempLeft
                    right = i
                }
                let moveChar = arr[tempLeft]
                if let val = map[moveChar] {
                    map[moveChar] = val + 1
                    if val == 0 {
                        count += 1
                    }
                }
                tempLeft += 1
            }
        }
        return len > s.count ? "" : String(arr[left...right])
    }
}
