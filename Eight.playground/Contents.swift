//: Playground - noun: a place where people can play

import UIKit

indirect enum Tree<U: Comparable> {
    case empty
    case node(U, Tree<U>, Tree<U>)
    
    func getValue() -> U? {
        switch self {
        case let .node(value, _, _):
            return value
        default:
            return nil
        }
    }
    
    func getLeft() -> Tree<U> {
        switch self {
        case let .node(_, left, _):
            return left
        default:
            return .empty
        }
    }
    
    func getRight() -> Tree<U> {
        switch self {
        case let .node(_, _, right):
            return right
        default:
            return .empty
        }
    }
    
    func insert(value: U) -> Tree<U> {
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
    
    static func fromArray(_ array: [U]) -> Tree<U> {
        return array.reduce(.empty) { $0.insert(value: $1) }
    }
}

let tree: Tree<Int> = Tree.fromArray([5, 4, 10, 3])
