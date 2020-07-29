import Foundation

class Q56MergeIntervals {
    
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
    * Solution 1:
    * Sort List by start, and compare/merge all ends
    *      if cur.end >= next.start
    *          means cur and next could be merge, then the new interval.end is the max(cur.end, next.end)
    *          delete the next
    *          the compare current to the 3rd next to current (2nd after delete the 2nd)
    *      else index++
    *
    * Time: if intervals is kinds of ArrayList, Due to delete the 2nd if merge, will move all behind intervals to pre 1 index, so O(n - 1) + O(n - 2) + ... + O(1) = O(n ^ 2)
    * If intervals is kinds of LinkedList O(n)
    * Space: O(1)
    */

    func merge_1(_ intervals: [[Int]]) -> [[Int]] {
        var intervals = intervals.sorted { (interval1, interval2) -> Bool in
            interval1[0] < interval2[0]
        }
        var index = 0
        while index < intervals.count - 1 {
            var cur = intervals[index]
            let next = intervals[index + 1]
            if cur[1] >= next[0] {
                cur[1] = max(cur[1], next[1])
                intervals[index] = cur
                intervals.remove(at: index + 1)
            } else {
                index += 1
            }
        }
        return intervals
    }
    
    /*
    * Solution 2:
    * Alloc new array to store new interval, (avoid when deleting element in array, extra time complexity move all behind ones to front)
    * Keep record of a pre interval, compare with each interval in intervals
    * if the cur is the first (means pre == null), or cur.start > pre.end (cannot merge anymore) add cur to result list, and cur to pre for next compare
    * else set pre.end = cur.end (pre is referenced the last interval in result array, so if the last interval in intervals is merged to pre one, it's already merged into the last interval in result list, no need for a post step)
    *
    * Time: O(n)
    * Space: O(1)
    */
    
    func merge_2(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { (interval1, interval2) -> Bool in
            interval1[0] < interval2[0]
        }
        var result: [[Int]] = []
        for interval in intervals {
            guard var last = result.last else {
                result.append(interval)
                continue
            }
            if last[1] >= interval[0] {
                last[1] = max(last[1], interval[1])
                result.removeLast()
                result.append(last)
            } else {
                result.append(interval)
            }
        }
        return result
    }
}
