//
//  main.swift
//  QuickSort
//
//  Created by Ts SaM on 17/7/2023.
//

import Foundation

// * Quick Sort (Does not sort in-place)
// Space Complexity: O(n) -> Your implementation should be O(1) (which means you're not supposed to create new arrays)
func quickSortSlow<T: Comparable>(_ arr: [T]) -> [T] {
    if arr.count <= 1 { return arr }
    var elements = arr
    let pivot = elements.removeLast()
    let lessOrEqual = elements.filter { $0 <= pivot }
    let greater = elements.filter { $0 > pivot }
    return quickSortSlow(lessOrEqual) + [pivot] + quickSortSlow(greater)
}

// * Quick Sort (sorts in-place)
// Time Complexity: O(N lgN) -> technically O(N^2) in the worst case
// Space Complexity: O(1)
func quickSort<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) {
    if start < end {
        let partitionIndex = partition(&arr, start, end)
        quickSort(&arr, start, partitionIndex - 1)
        quickSort(&arr, partitionIndex + 1, end)
    }
}

/// Returns the index of the pivot
/// - Parameters:
///   - arr: the array
///   - start: the start index
///   - end: the end index
/// - Returns: the index of the pivot after partitioning
func partition<T: Comparable>(_ arr: inout [T], _ start: Int, _ end: Int) -> Int {
    var pivotStart = start
    let pivotEnd = arr[end]
    
    for i in start..<end {
        if arr[i] < pivotEnd {
            arr.swapAt(pivotStart, i)
            pivotStart += 1
        }
    }
    
    arr.swapAt(pivotStart, end)
    return pivotStart
}


var numbers = [5, 2, 9, 1, 7, 3, 10]
quickSort(&numbers, 0, numbers.count - 1)
print(numbers)
