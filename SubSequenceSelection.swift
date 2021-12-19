//
//  SubSequenceSelection.swift
//
//
//  Created by MohamedRafat on 12/19/21.
//

import Foundation

// Sub-sequence selection from a sequence
/*
    - Assume you have a sequence of numbers and you have to select the longest subsequence.
    - ex. [6, 4, 2, 7, 8, 8, 3] --> lss = 4
 */

func longestSubSequence(_ sequence: inout [Int], _ index: Int, _ previous: Int) -> Int{
    
    if index >= sequence.count{
        return 0
    }
        
    let lSSWithoutCurrent = longestSubSequence(&sequence, index + 1, previous)
    var lSSWithCurrent = 0
    if sequence[index] >= previous {
        lSSWithCurrent = longestSubSequence(&sequence, index + 1, sequence[index]) + 1
    }
    return max(lSSWithCurrent, lSSWithoutCurrent)
}

func max(_ a: Int, _ b: Int) -> Int {
    return a > b ? a : b
}

var s = [6, 4, 2, 7, 8, 8, 3, 4, 6, 7]
var memoList: [Int] = Array(repeating: -1, count: (s.count + 1))
let lss = longestSubSequence(&s, 0, 0)
print(lss)

