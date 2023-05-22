
import Foundation

public struct DFSPreOrderTreeIterator<Value:NodeProtocol>: IteratorProtocol{
    //var root: any TreeNodeClass
    public init(_ root:  Value){
        stack = [root]
        stack.append(contentsOf: root.descendents)
        stack.reverse()
        
    }
    private var stack: [Value] = []
    public mutating func next() -> (Value)? {
        stack.popLast()        
    }
}
