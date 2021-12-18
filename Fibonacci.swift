//
//  Fibonacci.swift
//
//
//  Created by MohamedRafat on 12/18/21.
//

import Foundation

/// Fibonacci
/*
    - Notes:-
       - F(n) = F(n - 1) + F(n - 2)
       - F(0) = 1, F(1) = 1
 */

//Naive Recursive approach
func fibonacci(_ n: Int) -> Int{
    if n <= 1 {
        return 1
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}

// Dynamic Programming Memoization (Top-Down)
func fibonacciMemo(_ n: Int, memoList: inout [Int]) -> Int {
    if n == 0 || n == 1 {
        memoList[n] = 1
        return memoList[n]
    }
    if memoList[n] != 0 {
        return memoList[n]
    }
    memoList[n] = fibonacciMemo(n - 1, memoList: &memoList) + fibonacciMemo(n - 2, memoList: &memoList)
    return memoList[n]
}

// Dynamic Programming Tabulation (Bottom-Up)
func fibonacciDP(_ n: Int, _ memoList: inout [Int]) -> Int {
    if n == 0 || n == 1 {
        return memoList[n]
    }
    for i in 2...n {
       memoList[i] = memoList[i - 1] + memoList[i - 2]
    }
    return memoList[n]
}


print(fibonacci(10))
var memoList: [Int] = Array(repeating: 0, count: 51)
print(fibonacciMemo(50, memoList: &memoList))
var memoList2: [Int] = Array(repeating: 0, count: 51)
memoList2[0] = 1
memoList2[1] = 1
print(fibonacciDP(50, &memoList2))
