//
//  Q819MostCommonWord.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 9/4/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q819MostCommonWord: NSObject {

    //Difficulty: easy
    //TAG: Amazon
    //TAG: string
    //TAG: map

    /**
     * 819. Most Common Word
     * Given a paragraph and a list of banned words, return the most frequent word that is not in the list of banned words.  It is guaranteed there is at least one word that isn't banned, and that the answer is unique.
     *
     * Words in the list of banned words are given in lowercase, and free of punctuation.  Words in the paragraph are not case sensitive.  The answer is in lowercase.
     *
     *
     *
     * Example:
     *
     * Input:
     * paragraph = "Bob hit a ball, the hit BALL flew far after it was hit."
     * banned = ["hit"]
     * Output: "ball"
     * Explanation:
     * "hit" occurs 3 times, but it is a banned word.
     * "ball" occurs twice (and no other word does), so it is the most frequent non-banned word in the paragraph.
     * Note that words in the paragraph are not case sensitive,
     * that punctuation is ignored (even if adjacent to words, such as "ball,"),
     * and that "hit" isn't the answer even though it occurs more because it is banned.
     *
     *
     * Note:
     *
     * 1 <= paragraph.length <= 1000.
     * 0 <= banned.length <= 100.
     * 1 <= banned[i].length <= 10.
     * The answer is unique, and written in lowercase (even if its occurrences in paragraph may have uppercase symbols, and even if it is a proper noun.)
     * paragraph only consists of letters, spaces, or the punctuation symbols !?',;.
     * There are no hyphens or hyphenated words.
     * Words only consist of letters, never apostrophes or other punctuation symbols.
     */

    /*
    Solution:

    1. convert banned to set for fast search
    2. count words not in banned set in map, keep update max count and related word

    return final word

    Time: O(m + n)
    Space: O(m + n)
     */
    
    func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {
        var str = "", maxCount = 0, res = ""
        var set: Set<String> = Set(banned)
        var map: [String: Int] = [ : ]
        for char in paragraph {
            if char.isLetter {
                str.append(char.lowercased())
            } else {
                if !str.isEmpty && !set.contains(str) {
                    map[str] = (map[str] ?? 0) + 1
                    if map[str]! > maxCount {
                        maxCount = map[str]!
                        res = str
                    }
                }
                str = ""
            }
        }
        if !str.isEmpty && !set.contains(str) {
            map[str] = (map[str] ?? 0) + 1
            if map[str]! > maxCount {
                maxCount = map[str]!
                res = str
            }
        }
        return res
    }
}
