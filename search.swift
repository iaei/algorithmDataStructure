import UIKit
import Foundation

let a = [2, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 6, 7, 7, 55, 73, 74]

func binarySearch(array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    var mid: Int!
    
    while low <= high {
        /**
         这里的mid计算
         1. 不写成 Int((high + low) / 2) 是防止溢出
         2. 不写成 Int(high / 2 + low / 2) 是防止两次丢失精度，导致计算结果错误
         */
        mid = Int(low + (high - low) / 2)
        if array[mid] == target {
            return mid
        } else if array[mid] < target {
            low = mid + 1
        } else if array[mid] > target {
            high = mid - 1
        }
    }
    return -1
}

print(binarySearch(array: a, target: 55))


func binarySearchFirst(array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    var mid: Int!
    
    while low <= high {
        mid = Int(low + (high - low) / 2)
        if array[mid] == target {
            if mid == low || array[mid - 1] < array[mid] {
                return mid
            } else {
                high = mid - 1
            }
        } else if array[mid] < target {
            low = mid + 1
        } else if array[mid] > target {
            high = mid - 1
        }
    }
    return -1
}

print(binarySearchFirst(array: a, target: 6))

func binarySearchLast(array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    var mid: Int!
    
    while low <= high {
        mid = Int(low + (high - low) / 2)
        
        if array[mid] == target {
            if mid == high || array[mid] < array[mid + 1] {
                return mid
            } else {
                low = mid + 1
            }
        } else if array[mid] < target {
            low = mid + 1
        } else if array[mid] > target {
            high = mid - 1
        }
    }
    
    return -1
}

print(binarySearchLast(array: a, target: 6))

func binarySearchFirstLargerOrEqual(array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    var mid: Int!
    
    while low <= high {
        mid = Int(low + (high - low) / 2)
        
        if array[mid] >= target {
            if mid == low || array[mid - 1] < target {
                return mid
            } else {
                high = mid - 1
            }
        } else {
            low = mid + 1
        }
    }
    
    return -1
}

print(binarySearchFirstLargerOrEqual(array: a, target: 56))

func binarySearchLastSmallerOrEqual(array: [Int], target: Int) -> Int {
    var low = 0
    var high = array.count - 1
    var mid: Int!
    
    while low <= high {
        mid = Int(low + (high - low) / 2)
        
        if array[mid] <= target {
            if mid == high || array[mid + 1] > target {
                return mid
            } else {
                low = mid + 1
            }
        } else {
            high = mid - 1
        }
    }
    
    return -1
}

print(binarySearchLastSmallerOrEqual(array: a, target: 54))
