
import UIKit
import Foundation

// 单向不带头链表
class SinglyNoLeadingLinkedList: NSObject {
    var head: SinglyLinkedListNode?
    
    init(head: SinglyLinkedListNode?) {
        self.head = head
    }
    
    func append(node: SinglyLinkedListNode) {
        node.next = nil
        
        if let lastNode = lastNode() {
            lastNode.next = node
        } else {
            head = node
        }
    }
    
    func remove(index: Int) {
        if index == 0 {
            head = head?.next
            return
        }
        
        if let nodeBeforeRemoveIndex = nodeAtIndex(index: index - 1) {
            nodeBeforeRemoveIndex.next = nodeBeforeRemoveIndex.next?.next
        } else {
            print("target index is out of range")
        }
    }
    
    func lastNode() -> SinglyLinkedListNode? {
        var currentNode = head
        while currentNode?.next != nil {
            currentNode = currentNode?.next
        }
        return currentNode
    }
    
    func nodeAtIndex(index: Int) -> SinglyLinkedListNode? {
        if index < 0 {
            return nil
        }
        
        if index == 0 {
            return head
        }
        
        var currentIndex = 0
        var currentNode = head
        
        while currentNode?.next != nil {
            currentIndex += 1
            currentNode = currentNode?.next
            
            if currentIndex == index {
                return currentNode
            } else {
                continue
            }
        }
        return nil
    }
}

extension SinglyNoLeadingLinkedList: Sequence {
    typealias Iterator = LinkedListIterator
    
    func makeIterator() -> SinglyNoLeadingLinkedList.Iterator {
        return LinkedListIterator.init(head: head)
    }
}

class LinkedListIterator: IteratorProtocol {
    
    typealias Element = Any
    var currentNode: SinglyLinkedListNode?
    var head: SinglyLinkedListNode?
    
    init(head: SinglyLinkedListNode?) {
        self.head = head
    }
    
    func next() -> LinkedListIterator.Element? {
        if currentNode == nil {
            currentNode = head
        } else {
            currentNode = currentNode?.next
        }
        return currentNode?.data.debugDescription
    }
}

class SinglyLinkedListNode: NSObject {
    var next: SinglyLinkedListNode?
    var data: Any? = nil
    
    init(next: SinglyLinkedListNode?, data: Any?) {
        self.next = next
        self.data = data
    }
}
//
//let head = SinglyLinkedListNode.init(next: nil, data: "head")
//var L1 = SinglyNoLeadingLinkedList.init(head: head)
//L1.append(node: SinglyLinkedListNode.init(next: nil, data: "secondNode"))
//
//
//L1.nodeAtIndex(index: 0)?.data
//L1.nodeAtIndex(index: 1)?.data
//L1.nodeAtIndex(index: 3)?.data


// 单向带头链表
class SinglyLeadingLinkedList: NSObject {
    let head: SinglyLinkedListNode = SinglyLinkedListNode.init(next: nil, data: nil)
    
    func lastNode() -> SinglyLinkedListNode {
        var currentNode = head
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        return currentNode
    }
    
    func append(node: SinglyLinkedListNode) {
        node.next = nil
        lastNode().next = node
    }
    
    func remove(index: Int) {
        if index < 0 {
            return
        }
        
        if index == 0 {
            print("leading linked list can not remove first node")
            return
        }
        
        if let nodeBeforeRemove = nodeAtIndex(index: index - 1) {
            nodeBeforeRemove.next = nodeBeforeRemove.next?.next
        }
    }
    
    func nodeAtIndex(index: Int) -> SinglyLinkedListNode? {
        var currentIndex = 0
        var currentNode: SinglyLinkedListNode? = head
        
        if currentIndex == index {
            return currentNode
        }
        
        while currentNode?.next != nil {
            currentIndex += 1
            currentNode = currentNode?.next
            
            if currentIndex == index {
                return currentNode
            }
        }
        return nil
    }
}

var L2 = SinglyLeadingLinkedList()
L2.append(node: SinglyLinkedListNode.init(next: nil, data: "first"))
L2.head.data
L2.head.next?.data

// 链表反转
let reverseHead = SinglyLinkedListNode.init(next: nil, data: 1)
var reverseLinkedList = SinglyNoLeadingLinkedList.init(head: reverseHead)
reverseLinkedList.append(node: SinglyLinkedListNode.init(next: nil, data: 2))
reverseLinkedList.append(node: SinglyLinkedListNode.init(next: nil, data: 3))
reverseLinkedList.append(node: SinglyLinkedListNode.init(next: nil, data: 4))
reverseLinkedList.append(node: SinglyLinkedListNode.init(next: nil, data: 5))

func _reverseLinkedList(linkedList: SinglyNoLeadingLinkedList) {
    // var currentNode = linkedList.head
    var currentNode = linkedList.head
    
    while currentNode?.next != nil {
        let nnxt = currentNode?.next?.next
        currentNode?.next?.next = linkedList.head
        linkedList.head = currentNode?.next
        currentNode?.next = nnxt
    }
}

_reverseLinkedList(linkedList: reverseLinkedList)
// let listIterator = reverseLinkedList.makeIterator()
for i in reverseLinkedList {
    print(i)
}

// 链表中的环检测
let node1 = SinglyLinkedListNode.init(next: nil, data: "1")
let node2 = SinglyLinkedListNode.init(next: nil, data: "2")
let node3 = SinglyLinkedListNode.init(next: nil, data: "3")
let node4 = SinglyLinkedListNode.init(next: nil, data: "4")
let node5 = SinglyLinkedListNode.init(next: nil, data: "5")
let node6 = SinglyLinkedListNode.init(next: nil, data: "6")
let node7 = SinglyLinkedListNode.init(next: nil, data: "7")
let node8 = SinglyLinkedListNode.init(next: nil, data: "8")
let node9 = SinglyLinkedListNode.init(next: nil, data: "9")
let node10 = SinglyLinkedListNode.init(next: nil, data: "10")

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7
node7.next = node8
node8.next = node9
node9.next = node10

let circleLinkedList = SinglyNoLeadingLinkedList.init(head: node1)

func checkIsCircleInLinkedList(linkedList: SinglyNoLeadingLinkedList) -> SinglyLinkedListNode? {
    var slowHand: SinglyLinkedListNode? = linkedList.head
    var fastHand: SinglyLinkedListNode? = linkedList.head
    var slowHandStep = 0
    
    while fastHand?.next?.next != nil {
        slowHand = slowHand?.next
        slowHandStep += 1
        fastHand = fastHand?.next?.next
        
        if slowHand === fastHand {
            // 计算入环口
            var meetPointHand = fastHand
            slowHand = linkedList.head
            
            if meetPointHand === linkedList.head {
                print("环大小", slowHandStep, "入环点", linkedList.head)
                return linkedList.head
            }
            
            while true {
                slowHand = slowHand?.next
                meetPointHand = meetPointHand?.next
                if slowHand === meetPointHand {
                    print("环大小", slowHandStep, "入环点", meetPointHand)
                    return meetPointHand
                }
            }
        }
    }
    print("链表没有环")
    return nil
}

checkIsCircleInLinkedList(linkedList: circleLinkedList)?.data
