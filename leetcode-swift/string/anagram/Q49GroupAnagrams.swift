//
//  Q49GroupAnagrams.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/1/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q49GroupAnagrams: NSObject {

    //TAG: Facebook
    //TAG: Amazon
    //TAG: Uber
    //TAG: Others
    //Difficulty: Medium

    /**
     * 49. Group Anagrams
     * Given an array of strings, group anagrams together.

     For example, given: ["eat", "tea", "tan", "ate", "nat", "bat"],
     Return:

     [
     ["ate", "eat","tea"],
     ["nat","tan"],
     ["bat"]
     ]
     Note: All inputs will be in lower-case.
     */

    /*
     * Solution 1:
     * Anagram problem, if there's one anagram, or all compare to one, could use HashMap or int[26/256] depends on String
     * is ASCII only or unicode
     * This problem need to check O^2 time by map_set/int[] method, so:
     * sort every string, then put in a map<String, List<String>>
     *
     * Time: O(n * nlog(n)) = O(n^2log(n))
     * Space: O(n) if every string has no anagram
     */
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        for str in strs {
            let seq = String(str.sorted())
            if map[seq] == nil {
                map[seq] = [String]()
            }
            map[seq]?.append(str)
        }
        return Array(map.values)
    }
}
