var a = [1,4,2,5,7,3,2]

// 稳定排序（相同的数字不做交换），原地排序，时间复杂度O(n^2)，空间复杂度O(1), 交换次数等于逆序度
func bubbleSort(array: [Int]) -> [Int] {
    var a = array
    for _ in 0..<a.count {
        var hasSwap = false
        for idx in 0..<a.count - 1 {
            if a[idx] > a[idx + 1] {
                let c = a[idx]
                a[idx] = a[idx + 1]
                a[idx + 1] = c
                hasSwap = true
            }
        }
        
        if !hasSwap {
            return a
        }
    }
    return a
}

print(bubbleSort(array: a))

// 稳定排序（相同的数字插入到后面），原地排序，时间复杂度O(n^2)，空间复杂度O(1)
func insertionSort(array: [Int]) -> [Int] {
    var a = array
    var sortedIndex = 0
    while sortedIndex < a.count - 1 {
        let elementNeedSort = a[sortedIndex + 1]
        for idx in 0...sortedIndex {
            if elementNeedSort < a[idx] {
                // 搬移数据
                for idxNeedMove in idx...sortedIndex {
                    a[idx + sortedIndex - idxNeedMove + 1] = a[idx + sortedIndex - idxNeedMove]
                }
                // 插入新数据
                a[idx] = elementNeedSort
                break
            }
        }
        sortedIndex += 1
    }
    return a
}

print(insertionSort(array: a))


// 非稳定排序，原地排序，时间复杂度O(n^2)，空间复杂度O(1)
func selectionSort(array: [Int]) -> [Int] {
    var a = array
    var sortedIndex = -1
    var minElementInCircle: Int?
    var minIndex: Int?
    while sortedIndex < a.count - 1 {
        for i in sortedIndex + 1..<a.count {
            if minElementInCircle == nil || a[i] < minElementInCircle! {
                minElementInCircle = a[i]
                minIndex = i
            }
        }
        // 交换
        a[minIndex!] = a[sortedIndex + 1]
        a[sortedIndex + 1] = minElementInCircle!
        minElementInCircle = nil
        minIndex = nil
        sortedIndex += 1
    }
    return a
}

print(selectionSort(array: a))

// 稳定排序（merge时遇到一样大小的值，将前段的值放在后段之前），时间复杂度O(nlogn)，空间复杂度O(n)
func mergeSort(array: [Int]) -> [Int] {
    var a = array
    mergeSortSplit(array: &a, startIdx: 0, endIdx: a.count - 1)
    return a
}

func mergeSortSplit(array: inout [Int], startIdx: Int, endIdx: Int) {
    var tmp: [Int] = []
    let r = Int((startIdx + endIdx) / 2)
    
    if startIdx < endIdx {
        mergeSortSplit(array: &array, startIdx: startIdx, endIdx: r)
        mergeSortSplit(array: &array, startIdx: r + 1, endIdx: endIdx)
        merge(array: &array, startIndex1: startIdx, endIndex1: r, startIndex2: r + 1, endIndex2: endIdx)
    }
}

func merge(array: inout [Int], startIndex1: Int, endIndex1: Int, startIndex2: Int, endIndex2: Int){
    var tmp: [Int] = Array.init(repeating: -9999, count: (endIndex1 - startIndex1) + (endIndex2 - startIndex2) + 2)
    var i = 0
    var startIdx1 = startIndex1
    let endIdx1 = endIndex1
    var startIdx2 = startIndex2
    let endIdx2 = endIndex2

    while startIdx1 <= endIdx1 && startIdx2 <= endIdx2 {
        if array[startIdx1] <= array[startIdx2] {
            tmp[i] = array[startIdx1]
            startIdx1 += 1
        } else {
            tmp[i] = array[startIdx2]
            startIdx2 += 1
        }
        i += 1
    }
    
    while startIdx1 <= endIdx1 {
        tmp[i] = array[startIdx1]
        startIdx1 += 1
        i += 1
    }
    
    while startIdx2 <= endIdx2 {
        tmp[i] = array[startIdx2]
        startIdx2 += 1
        i += 1
    }
    
    for j in 0..<tmp.count {
        array[startIndex1 + j] = tmp[j]
    }
}

print(mergeSort(array: a))

//
func quickSort(array: [Int]) -> [Int] {
    var a = array
    quickSortSlipt(array: &a, startIndex: 0, endIndex: array.count - 1, p: array.count - 1)
    return a
}

func quickSortSlipt(array: inout [Int], startIndex: Int, endIndex: Int, p: Int) {
    // 快指针向后迭代，慢指针指向第一个大于pivot的位置
    let pivot = array[p]
    var slowPoint = startIndex
    var fastPoint = startIndex
    
    if startIndex >= endIndex {
        return
    }
    
    while fastPoint < endIndex {
        if array[slowPoint] > pivot {
            if slowPoint < fastPoint && array[fastPoint] <= pivot {
                let c = array[slowPoint]
                array[slowPoint] = array[fastPoint]
                array[fastPoint] = c
                
                slowPoint += 1
            }
        } else {
            slowPoint += 1
        }
        fastPoint += 1
    }
    
    //
    let c = array[slowPoint]
    array[slowPoint] = array[fastPoint]
    array[fastPoint] = c
    
    quickSortSlipt(array: &array, startIndex: startIndex, endIndex: slowPoint - 1, p: slowPoint - 1)
    quickSortSlipt(array: &array, startIndex: slowPoint + 1, endIndex: endIndex, p: endIndex)
}

print(quickSort(array: a))

/**
 三种线性排序
 1. 桶排序（bucketSort）
 2. 计数排序（countingSort）
 3. 基数排序（radixSort）
 */
