import UIKit
import Foundation

// 顺序队列（使用数组实现的队列）
class ArrayQueue {
    var stringArray: [String?] = []
    var n: Int = 0

    var head: Int = 0
    var tail: Int = 0

    init(capacity: Int) {
        stringArray = Array.init(repeating: nil, count: capacity)
        n = capacity
    }

    func enqueue(data: String) -> Bool {
        
        if tail > n - 1 {
            moveArray()
        }
        
        guard tail <= n - 1 else {
            return false
        }
        
        stringArray[tail] = data
        tail += 1
        printQueue()
        return true
    }

    func dequeue() -> String {
        let res = stringArray[head]
        head += 1
        printQueue()
        return res ?? ""
    }
    
    private func moveArray() {
        if head == 0 { return }
        var index = 0
        for i in head..<tail {
            stringArray[index] = stringArray[i]
            index += 1
        }
        head = 0
        tail = index
    }
    
    private func printQueue() {
        let slice = stringArray[head...tail - 1]
        print(slice)
    }
}

let a = ArrayQueue.init(capacity: 4)
a.enqueue(data: "1")
a.enqueue(data: "2")
a.enqueue(data: "3")
a.enqueue(data: "4")
a.dequeue()
a.dequeue()
a.enqueue(data: "6")

// 链式队列（使用链表实现的队列）
class LinkedQueue {
    
}
