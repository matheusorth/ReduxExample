//
//  MainReducer.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import Foundation
import ReSwift

func mainViewReducer(action: Action, state: MainViewState?) -> MainViewState {
    var state = state ?? MainViewState()
    guard let action = action as? MainAction else { return state }
    switch action {
    case .initialize:
        state.producerCounter = 0
        state.consumerCounter = 0
        state.productCounter = 0
        state.tendency = .balance
        state.productAction = .none
    case .addConsumer:
        state.consumerCounter += 1
        state.tendency = state.calculateTendency(numberOfConsumers: state.consumerCounter, numberOfProducers: state.producerCounter)
        state.productAction = .none
        let newTimer = Timer(timeInterval:  TimeInterval(Consumer.intervalOfAction), repeats: true, block: { (_) in
            store.dispatch(MainAction.removeProduct)
        })
        RunLoop.current.add(newTimer, forMode: .common)
        if state.timers?.append(newTimer) == nil {
            state.timers = [newTimer]
        }
    case .addProducer:
        state.producerCounter += 1
        state.tendency = state.calculateTendency(numberOfConsumers: state.consumerCounter, numberOfProducers: state.producerCounter)
        state.productAction = .none
        let newTimer = Timer(timeInterval: TimeInterval(Producer.intervalOfAction), repeats: true, block: { (_) in
            store.dispatch(MainAction.insertProduct)
        })
        RunLoop.current.add(newTimer, forMode: .common)
        if state.timers?.append(newTimer) == nil {
            state.timers = [newTimer]
        }
    case .insertProduct:
        state.productCounter += 1
        state.productAction = .insert(IndexPath(row: state.productCounter - 1, section: 0))
    case .removeProduct:
        guard state.productCounter > 0 else { return state }
        state.productCounter -= 1
        state.productAction = .remove(IndexPath(row: state.productCounter, section: 0))
    }
    return state
}
