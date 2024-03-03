/*
Link: https://leetcode.com/problems/remove-nth-node-from-end-of-list
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given the head of a linked list, remove the `nth` node from the end of the list and return its head.
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 1 -> 2 -> 3 -> 4 -> 5 -> nil
 1 -> 2 -> 3 -> 5 -> nil

 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 
 #Example 2:
 Input: head = [1], n = 1
 Output: []
 
 #Example 3:
 Input: head = [1,2], n = 1
 Output: [1]
 
*/

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    public func description() -> String {
        var head: ListNode? = self
        var string: String = ""
        while head != nil {
            string.append("\(head?.val ?? 0) ")
            string.append("-> ")
            head = head?.next
        }
        string.append(" nil")
        return string
    }
}

// Solution 1 - Two Pointer Approch

/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var dummy = ListNode(0)
    dummy.next = head
    var first: ListNode? = dummy
    var second: ListNode? = dummy
    
    for _ in 0...n {
        first = first?.next
    }
    
    while first != nil {
        first = first?.next
        second = second?.next
    }
    
    second?.next = second?.next?.next
    
    return dummy.next
}

let fifthNode = ListNode(5)
let fourthNode = ListNode(4, fifthNode)
let thirdNode = ListNode(3, fourthNode)
let secondNode = ListNode(2, thirdNode)
let headNode = ListNode(1, secondNode)

headNode.description()
removeNthFromEnd(headNode, 2)
headNode.description()
