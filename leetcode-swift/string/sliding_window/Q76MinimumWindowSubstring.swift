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
        if s.isEmpty || t.isEmpty || s.count < t.count {
            return ""
        }
        var map = [Character: Int]()
        for char in t {
            map[char] = (map[char] ?? 0) + 1
        }
        let arr = Array(s)
        var count = 0, len = Int.max, left = 0, right = 0, temp = 0
        for index in 0 ..< arr.count {
            let char = arr[index]
            if let val = map[char] {
                map[char] = val - 1
                if map[char] == 0 {
                    count += 1
                }
            }
            if count == map.count && len > index - temp + 1 {
                len = index - temp + 1
                right = index
                // don't need update left since next will try to reduce the valid string size to find min size, update left at that time
            }
            while count == map.count {
                let char = arr[temp]
                if let val = map[char] {
                    map[char] = val + 1
                    if val + 1 > 0 {
                        count -= 1
                    }
                }
                if len > index - temp + 1 {
                    len = index - temp + 1
                    left = temp
                    right = index
                }
                temp += 1
            }
        }
        return len == Int.max ? "" : String(arr[left ... right])
    }
}
