/*
Link: https://leetcode.com/problems/merge-two-sorted-lists
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 You are given the heads of two sorted linked lists list1 and list2.

 Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

 Return the head of the merged linked list.
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: list1 = [1,2,4], list2 = [1,3,4]
 Output: [1,1,2,3,4,4]
 
 #Example 2:
 Input: list1 = [], list2 = []
 Output: []
 
 #Example 3:
 Input: list1 = [], list2 = [0]
 Output: [0]
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

// Solution 1 - Two Pointer Approach
/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(m + n)
 Space Complexity: O(1)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var dummy = ListNode(0)
    var current: ListNode? = dummy
    var l1 = list1
    var l2 = list2
    
    while l1?.val != nil && l2?.val != nil {
        if l1!.val > l2!.val {
            current?.next = l2
            l2 = l2?.next
        } else {
            current?.next = l1
            l1 = l1?.next
        }
        
        current = current?.next
    }
    
    if l1 != nil {
        current?.next = l1
    } else if l2 != nil {
        current?.next = l2
    }
    
    dummy.next?.description()
    return dummy.next
}

let list1 = ListNode(1, ListNode(2, ListNode(3)))
list1.description()
let list2 = ListNode(-1, ListNode(0, ListNode(1, ListNode(4))))
list2.description()

mergeTwoLists(list1, list2)?.description()


