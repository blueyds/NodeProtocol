
import Foundation

public struct DFSPreOrderTreeIterator<Value:TreeNodeClass>: IteratorProtocol{
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
