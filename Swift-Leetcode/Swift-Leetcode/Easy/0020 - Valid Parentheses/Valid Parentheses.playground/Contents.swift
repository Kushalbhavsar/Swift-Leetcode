/*
Link: https://leetcode.com/problems/valid-parentheses
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
Question:-

 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:
 1. Open brackets must be closed by the same type of brackets.
 2. Open brackets must be closed in the correct order.
 3. Every close bracket has a corresponding open bracket of the same type.

 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 
 #Example 1:
 Input: s = "()"
 Output: true
 
 #Example 2:
 Input: s = "()[]{}"
 Output: true
 
 #Example 3:
 Input: s = "(]"
 Output: false
*/

func isValidParentheses(_ s: String) -> Bool {
    var stack: [Character] = []
    for char in s {
        switch char {
        case "(" : stack.append(")")
        case "{" : stack.append("}")
        case "[" : stack.append("]")
        default:
            if stack.isEmpty || stack.removeLast() != char {
                return false
            }
        }
    }
    
    return stack.isEmpty
}

isValidParentheses("(){}[]")
isValidParentheses("({[]})")
isValidParentheses("(]")


/*
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 Time Complexity: O(n) ~ it iterates through the entire string once
 Space Complexity: O(n)
 ----- ---------- ---------- ---------- ---------- --------- ----------- ----------
 */




