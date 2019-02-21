//
//  Q332ReconstructItinerary.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class Q332ReconstructItinerary: NSObject {
    
    //Difficulty: Medium
    //TAG: Snap
    //TAG: dfs
    
    /**
     * 332. Reconstruct Itinerary
     * Given a list of airline tickets represented by pairs of departure and arrival airports [from, to], reconstruct the itinerary in order. All of the tickets belong to a man who departs from JFK. Thus, the itinerary must begin with JFK.
     *
     * Note:
     *
     * If there are multiple valid itineraries, you should return the itinerary that has the smallest lexical order when read as a single string. For example, the itinerary ["JFK", "LGA"] has a smaller lexical order than ["JFK", "LGB"].
     * All airports are represented by three capital letters (IATA code).
     * You may assume all tickets form at least one valid itinerary.
     * Example 1:
     *
     * Input: [["MUC", "LHR"], ["JFK", "MUC"], ["SFO", "SJC"], ["LHR", "SFO"]]
     * Output: ["JFK", "MUC", "LHR", "SFO", "SJC"]
     * Example 2:
     *
     * Input: [["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]
     * Output: ["JFK","ATL","JFK","SFO","ATL","SFO"]
     * Explanation: Another possible reconstruction is ["JFK","SFO","ATL","JFK","ATL","SFO"].
     *              But it is larger in lexical order.
     */
    
    /*
     Solution:
     try to connect smallest lexical airport first, then we need a map which key is depart string, value
     is ascending array of dest (if sort manually), or priority queue
     
     requirement here is all Itinerary need be visited once
     
     dfs
     if add to list first then dfs, don't ensure that it could iterative all Itinerary, so:
     add to list after dfs, which means ensure that ensure that no connections after max lexical string first
     then we add first in list
     
     Time: O(nlogn if one key in map + n total steps in dfs) = O(nlogn + n)
     Space: O(n + n) = O(n)
     */
    
    func findItinerary(_ tickets: [[String]]) -> [String] {
        var map = [String: [String]]()
        for strs in tickets {
            var arr = map[strs[0]]
            if arr == nil { arr = [String]() }
            arr!.append(strs[1])
            map[strs[0]] = arr
        }
        for key in map.keys {
            map[key] = map[key]?.sorted()
        }
        var res = [String]()
        dfs(&map, &res, "JFK")
        return res
    }
    
    private func dfs(_ map: inout [String: [String]], _ res: inout [String], _ key: String) {
        while var arr = map[key], arr.count != 0 {
            let str = arr.removeFirst()
            map[key] = arr
            dfs(&map, &res, str)
        }
        res.insert(key, at: 0)
    }

}
