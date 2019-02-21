//
//  Q733FloodFill.swift
//  leetcode-swift
//
//  Created by Chengzhi Jia on 2/21/19.
//  Copyright © 2019 com.cj. All rights reserved.
//

import Cocoa

class Q733FloodFill: NSObject {
    
    //TAG: Uber
    //TAG: Snap
    //TAG: DFS
    //TAG: Breadth First Search
    //Difficulty: Easy
    
    /**
     * 733. Flood Fill
     * An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
     
     Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
     
     To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
     
     At the end, return the modified image.
     
     Example 1:
     Input:
     image = [[1,1,1],[1,1,0],[1,0,1]]
     sr = 1, sc = 1, newColor = 2
     Output: [[2,2,2],[2,2,0],[2,0,1]]
     Explanation:
     From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
     by a path of the same color as the starting pixel are colored with the new color.
     Note the bottom corner is not colored 2, because it is not 4-directionally connected
     to the starting pixel.
     Note:
     
     The length of image and image[0] will be in the range [1, 50].
     The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
     The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
     */
    
    /*
     * Solution:
     *
     * dfs
     *
     * Time: O(mn)
     * Space: O(mn)
     */
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        if image[sr][sc] == newColor { return image }
        var copyImage = image
        dfs(&copyImage, sr, sc, image[sr][sc], newColor)
        return copyImage
    }
    
    private func dfs(_ image: inout [[Int]], _ sr: Int, _ sc: Int, _ color: Int, _ newColor: Int) {
        if sr < 0 || sr >= image.count || sc < 0 || sc >= image[sr].count ||
            image[sr][sc] != color { return }
        image[sr][sc] = newColor
        dfs(&image, sr + 1, sc, color, newColor)
        dfs(&image, sr - 1, sc, color, newColor)
        dfs(&image, sr, sc + 1, color, newColor)
        dfs(&image, sr, sc - 1, color, newColor)
    }

}
