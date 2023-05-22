public protocol NodeProtocol: class, Sequence {
//  associatedtype NodeType: TreeNode where NodeType == Self
 // associatedtype Child: TreeNode where Child.Parent == Self
    var parent: Self? { get set }
    var children: [Self] { get set }
   // func makeIterator()->DFSPreOrderTreeIterator
    
}

extension NodeProtocol{
    public func makeIterator()-> DFSPreOrderTreeIterator<Self>{
        return DFSPreOrderTreeIterator(self)
    }
}
extension NodeProtocol{
    public func add(child: Self){
        children.append(child)
        child.set(parent: self)
    }
    public func set(parent node: Self?){
        self.parent = node
    }
    
    public var descendents: [ Self] {
        var result: [ Self] = []
        children.forEach(){    
            result.append($0)
            result.append(contentsOf: $0.descendents)
        }
        return result
    }
    
    public var ancestors: [Self]{
        var result: [Self] = []
        if parent != nil {
            result.append(parent!)
            result.append(contentsOf: parent!.ancestors)
        }
        return result
    }
}

extension NodeProtocol where Self: Identifiable {
    public func removeChild(node: Self){
        children.removeAll(where: {$0.id == node.id})
    }
    
    public func move(under node: Self){
        if parent != nil {
            parent!.removeChild(node: self)
        }
        node.add(child: self)
    }
}

extension NodeProtocol where Self: CustomStringConvertible{
    public var domainDescription: String {
        var result: String = ""
        ancestors.reversed().forEach() {node in
            result += node.description
            result += "."
        }
        result += self.description
        return result
    }
    public func printTree(){
        print(self.domainDescription)
        descendents.forEach(){node in
            print(node.domainDescription)
        }
    }
}
