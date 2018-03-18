//: Playground - noun: a place where people can play

import UIKit

indirect enum Tree<Element: Comparable> {
    case empty
    case node(Element, Tree<Element>, Tree<Element>)
    
    func getValue() -> Element? {
        switch self {
        case let .node(value, _, _):
            return value
        default:
            return nil
        }
    }
    
    func getLeft() -> Tree<Element> {
        switch self {
        case let .node(_, left, _):
            return left
        default:
            return .empty
        }
    }
    
    func getRight() -> Tree<Element> {
        switch self {
        case let .node(_, _, right):
            return right
        default:
            return .empty
        }
    }
    
    func insert(value: Element) -> Tree<Element> {
        switch self {
        case .empty:
            return .node(value, .empty, .empty)
        case let .node(node, left, right):
            if value < node {
                return .node(node, left.insert(value: value), right)
            } else if value > node {
                return .node(node, left, right.insert(value: value))
            }
            
            return self
        }
    }
    
    static func fromArray(_ array: [Element]) -> Tree<Element> {
        return array.reduce(.empty) { $0.insert(value: $1) }
    }
}

let tree: Tree<Int> = Tree.fromArray([5, 4, 10, 3])
