//
//  Enumerable.swift
//  airCloset
//
//  Created by Shohei Ohno on 2016/01/22.
//  Copyright © 2016年 Gungnir. All rights reserved.
//

public protocol Enumerable {
    associatedtype Case = Self
}

public extension Enumerable where Case: Hashable {
    private static var iterator: AnyIterator<Case> {
        var n = 0
        return AnyIterator {
            defer { n += 1 }
            
            let next = withUnsafePointer(to: &n) {
                UnsafeRawPointer($0).assumingMemoryBound(to: Case.self).pointee
            }
            return next.hashValue == n ? next : nil
        }
    }
    
    public static func enumerate() -> EnumeratedSequence<AnySequence<Case>> {
        return AnySequence(self.iterator).enumerated()
    }
    
    public static var elements: [Case] {
        return Array(self.iterator)
    }
    
    public static var count: Int {
        return self.elements.count
    }
}
