import UIKit

public class BinaryNode<Element> {
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
}

extension BinaryNode {
    
    // In-order Traversal
    public func traverseInOrder(visit: (Element) -> Void) {
        leftChild?.traverseInOrder(visit: visit)
        visit(value)
        rightChild?.traverseInOrder(visit: visit)
    }
    
    // Pre-order Traversal
    public func traversePreOrder(visit: (Element) -> Void) {
        visit(value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    // Post-order Traversal
    public func traversePostOrder(visit: (Element) -> Void) {
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(value)
    }
}

extension BinaryNode {
    
    public var discripition: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?, _ top: String = "", _ root: String = "", _ bottom: String = "") -> String {
        
        guard let node = node else {
            return root + "nil\n"
        }
        
        if node.leftChild == nil && node.rightChild == nil {
            return root + "\(node.value)\n"
        }
        
        return diagram(for: node.rightChild, top + " ", top + "┌──", top + "│ ")
        +  root + "\(node.value)\n"
        + diagram(for: node.leftChild, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}



var tree: BinaryNode<Int> {
    let zero = BinaryNode(value: 0)
    let one = BinaryNode(value: 1)
    let five = BinaryNode(value: 5)
    let seven = BinaryNode(value: 7)
    let eight = BinaryNode(value: 8)
    let nine = BinaryNode(value: 9)
    
    seven.leftChild = one
    one.leftChild = zero
    one.rightChild = five
    seven.rightChild = nine
    nine.leftChild = eight
    
    return seven
}

print(tree.discripition)

tree.traverseInOrder(visit: { print($0)})
tree.traversePreOrder(visit: { print($0)})
tree.traversePostOrder(visit: { print($0)})


// MARK: - Binary Search Tree -
//
// A binary search tree (or BST) is a data structure that facilitates fast lookup, addition, and
// removal operations. Each operation has an average time complexity of `O(log n)`, which is considerabl
// faster than linear data structures such as arrays and linked lists.
//
// A binary search tree achieve this performance by imposing two rules on the binary tree:
//
// 1. The value of a left child must be less than the value of its parent.
// 2. The value of a right child must be greater than or equal to the value of its parent.
//


public struct BinarySearchTree<Element: Comparable> {
    
    public private(set) var root: BinaryNode<Element>?
    
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    public var description: String {
        return root?.discripition ?? "empty tree"
    }
}

// MARK: Insert Method -
// In accordance with the rules of the BST,
// nodes of the left child must contain values less than the current node.
// Nodes of the right child must contain values greater than or equal to the current node
extension BinarySearchTree {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        
        return node
    }
}

var bst = BinarySearchTree<Int>()
for i in [5,4,7,3,7,8,2] {
    bst.insert(i)
}
print(bst)


// MARK: Search Method (using In-order Traversel) -
// Finding an element using in-order traversel requires you to traverse through all its nodes; once.
// Time complexity - O(n)

extension BinarySearchTree {
    
    public func contains(_ value: Element) -> Bool {
        guard let root = root else {
            return false
        }
        var found = false
        root.traverseInOrder { node in
            if node == value {
                found = true
            }
        }
        return found
    }
}

bst.contains(5)


// MARK: Optimized Search Method -
// We can rely on the rules of the BST to avoid needless comparisons.
// In a balanced binary search tree, this implementation has logarithmic runtime.
// Time complexity - O(log n)

extension BinarySearchTree {
    
    public func containsVal(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if node.value == value {
                return true
            }
            
            if value < node.value {
                current = node.leftChild
            } else {
                current = node.rightChild
            }
        }
        
        return false
    }
}

bst.containsVal(5)




