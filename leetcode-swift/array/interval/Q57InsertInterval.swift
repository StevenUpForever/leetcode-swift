//
//  Q57InsertInterval.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/28/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q57InsertInterval: NSObject {

    //TAG: Google
    //TAG: Facebook
    //TAG: LinkedIn
    //TAG: array
    //Difficulty: Hard

    /**
     * 57. Insert Interval
     * Given a set of non-overlapping intervals, insert a new interval into the intervals (merge if necessary).

     You may assume that the intervals were initially sorted according to their start times.

     Example 1:
     Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].

     Example 2:
     Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in as [1,2],[3,10],[12,16].

     This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].
     */

    /*
     * Solution:
     * As the intervals non-overlapped and sorted by start time
     * for loop the intervals from the start
     *      keep adding to list, find the last interval that end < newInterval.start, move to next, begin the merge
     *      Use the min(cur.start, newInterval.start) as the start
     *      loop next few intervals until the one which cur.start > newInterval.end
     *              every time use max(cur.end, newInterval.end) as the end
     *      Add this merged newInterval and rest of all intervals to list
     *
     * Time: O(n)
     * Space: O(n)
     */
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var results = [[Int]]()
        var index = 0
        while index < intervals.count && intervals[index][1] < newInterval[0] {
            results.append(intervals[index])
            index += 1
        }
        var interval = newInterval
        while index < intervals.count && intervals[index][0] <= interval[1] {
            interval[0] = min(interval[0], intervals[index][0])
            interval[1] = max(interval[1], intervals[index][1])
            index += 1
        }
        results.append(interval)
        results.append(contentsOf: intervals.suffix(from: index))
        return results
    }
}
