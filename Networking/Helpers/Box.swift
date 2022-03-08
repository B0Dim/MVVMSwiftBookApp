//
//  Box.swift
//  Networking
//
//  Created by BoDim on 08.03.2022.
//  Copyright © 2022 BoDim. All rights reserved.
//

class Box<T> {
    typealias Listener = (T) -> Void
    
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }
}
