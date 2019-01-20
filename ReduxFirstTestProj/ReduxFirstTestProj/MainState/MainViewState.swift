//
//  MainViewState.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import Foundation
import ReSwift

enum ProductAction: Equatable {
    case insert(IndexPath)
    case remove(IndexPath)
    case none
}

enum Tendency: String, Equatable {
    case balance = "⚖"
    case increase = "📈"
    case descrease = "📉"
}

struct MainViewState: StateType, Equatable {
    
    private var productText = "📦"
    
    // Getters
    var producerCounterText: String {
        return "\(producerCounter)"
    }
    
    var consumerCounterText: String  {
        return "\(consumerCounter)"
    }
    
    var productCounterText: String {
        return "\(productCounter)"
    }
    
    var productTitle: String {
        return "\(productText) - \(tendency.rawValue)"
    }
    
    // Setters
    var productAction: ProductAction = .none
    var tendency: Tendency = .balance
    var timers: [Timer]?
    var producerCounter: Int = 0
    var consumerCounter: Int = 0
    var productCounter: Int = 0
    
    func calculateTendency(numberOfConsumers: Int, numberOfProducers: Int) -> Tendency {
        let numberOfProductCreating = Double(numberOfProducers) * 1/9
        let numberOfProductConsuming = Double(numberOfConsumers) * 1/12
        let value = numberOfProductCreating - numberOfProductConsuming
        switch value {
        case let positive where positive > 0.0:
            return .increase
        case let negative where negative < 0.0:
            return .descrease
        default:
            return .balance
        }
    }
    
}
