//
//  MaxPower.swift
//
//
//  Created by MohamedRafat on 12/18/21.
//

import Foundation

/// Max Power
/*
    - You have a grid (n x n) and each cell has a power value, and only can move to the right or the down cell from your current cell.
    - Your task is to find the max power value strating from top leftmost cell till ending at the bottom rightmost cell.
 */

// Dynamic Programming Memoization (Recursive Top-Down)

func maxPower(_ row: Int, _ col: Int, _ powerGrid: [[Int]], _ maxPowerMemo: inout [[Int]]) -> Int {
    
    if row == powerGrid.count - 1 && col == powerGrid.count - 1 {
        return powerGrid[row][col]
    }
    
    if maxPowerMemo[row][col] != -1 {
        return maxPowerMemo[row][col]
    }
   
    if (col + 1) < powerGrid[col].count{ // Is there a right cell ?
        maxPowerMemo[row][col + 1] = maxPower(row, col + 1, powerGrid, &maxPowerMemo) // Right Max Power
    }
        
    if (row + 1) < powerGrid[row].count { // Is there down cell ?
        maxPowerMemo[row + 1][col] = maxPower(row + 1, col, powerGrid, &maxPowerMemo) // Down Max Power
    }
    
    return powerGrid[row][col] + max(maxPowerMemo[row][col + 1], maxPowerMemo[row + 1][col])
    
}

func max(_ a: Int, _ b: Int) -> Int {
    return a > b ? a : b
}


var powerGrid: [[Int]] = [[2, 6, 3], [4, 1, 7], [1, 8, 9]]
var maxPowerMeme: [[Int]] = Array(repeating: Array(repeating: -1, count: 4), count: 4)

let maxPowerResult = maxPower(0, 0, powerGrid, &maxPowerMeme)
print(maxPowerResult)

