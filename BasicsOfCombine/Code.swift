//
//  Code.swift
//  BasicsOfCombine
//
//  Created by Omar Radwan on 28/07/2023.
//

import Combine
import Foundation

private var anyCancellable = Set<AnyCancellable>()

func run() {
    Just(45)
        .delay(for: 1, scheduler: DispatchQueue.main)
        .sink { value in
            print(value)
        }.store(in: &anyCancellable)
    
    [1,2,3,4]
        .publisher
        .filter { $0.isMultiple(of: 2) == false }
        .print()
        .map { $0 * $0 }
        .sink { value in
            print(value)
        }.store(in: &anyCancellable)
    
    Just([1,2,3,4])
        .sink { values in
            print(values)
        }.store(in: &anyCancellable)
}
