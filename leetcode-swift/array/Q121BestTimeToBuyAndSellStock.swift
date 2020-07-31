//
//  Q121BestTimeToBuyAndSellStock.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 7/30/20.
//  Copyright © 2020 com.cj. All rights reserved.
//

import Cocoa

class Q121BestTimeToBuyAndSellStock: NSObject {

    //Difficulty: Easy
    //TAG: Facebook
    //TAG: Microsoft
    //TAG: Amazon
    //TAG: Uber
    //TAG: Apple
    //TAG: array

    /**
     * 121. Best Time to Buy and Sell Stock
     * Say you have an array for which the ith element is the price of a given stock on day i.

     If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.

     Example 1:
     Input: [7, 1, 5, 3, 6, 4]
     Output: 5

     max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)
     Example 2:
     Input: [7, 6, 4, 3, 1]
     Output: 0

     In this case, no transaction is done, i.e. max profit = 0.
     */

    /*
     * Solution:
     *
     * Due to sell need be after buy, and sell price need be higher than buy price
     * We need to update min price, and find possible max diff in after values
     *
     * Time: O(n)
     * Space: O(1)
     */
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard var buy = prices.first else {
            return 0
        }
        var maxProfit = 0
        prices.forEach { (price) in
            maxProfit = max(maxProfit, price - buy)
            buy = min(buy, price)
        }
        return maxProfit
    }
}
