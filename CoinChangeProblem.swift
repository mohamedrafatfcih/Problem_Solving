//
//  CoinChangeProblem.swift
//  
//
//  Created by MohamedRafat on 12/23/21.
//

import Foundation

//  The Coin Change Problem
    /*
        - n is the amount that need to be changed.
        - m is the number of the coins types that available.
        - example of the available coins to use them  [4, 7, 2, 0]
     */

 /// Memoization

func getWays(n: Int, c: [Int]) -> Int {
    var memo:[[Int]] = Array(repeating: Array(repeating: -1, count: c.count + 1), count: n + 1)
    return nWays(0, n, c, &memo)
}

func nWays(_ index: Int, _ reminder: Int, _ coins: [Int], _ memo: inout [[Int]]) -> Int {
    
    if reminder == 0 {
        return 1
    }
    if index >= coins.count || reminder < 0 {
        return 0
    }
    
    if memo[reminder][index] != -1 {
        return memo[reminder][index]
    }
    
    memo[reminder][index] = nWays(index + 1, reminder, coins, &memo) + nWays(index, reminder - coins[index], coins, &memo)

    return memo[reminder][index]
}

print(getWays(n: 4, c: [1, 2, 3]))
