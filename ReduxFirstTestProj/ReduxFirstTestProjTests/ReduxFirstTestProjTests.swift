//
//  StudyDriveTestProjectTests.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 14.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import XCTest
import ReSwift
@testable import ReduxFirstTestProj

class StudyDriveTestProjectTests: XCTestCase {
    
    var state: AppState!
    
    override func setUp() {
        state = appReducer(action: MainAction.initialize, state: nil)
    }

    func testAddProducer() {
        state = appReducer(action: MainAction.addProducer, state: state)
        XCTAssert(state.mainViewState.producerCounter == 1, "Producer not added")
        XCTAssert(state.mainViewState.timers?.count == 1, "Producer Timer not added")
    }
    
    func testAddConsumer() {
        state = appReducer(action: MainAction.addConsumer, state: state)
        XCTAssert(state.mainViewState.consumerCounter == 1, "Consumer not added")
        XCTAssert(state.mainViewState.timers?.count == 1, "Consumer Timer not added")
    }

    func testInsertProduct() {
        state = appReducer(action: MainAction.insertProduct, state: state)
        XCTAssert(state.mainViewState.productCounter == 1, "Product not added")
        XCTAssert(state.mainViewState.productAction == .insert(IndexPath(row: 0, section: 0)), "did Not insert cell, or not in the right location")
    }
    
    func testRemoveProduct() {
        state.mainViewState.productCounter = 1
        state = appReducer(action: MainAction.removeProduct, state: state)
        XCTAssert(state.mainViewState.productCounter == 0, "Product not removed")
        XCTAssertEqual(state.mainViewState.productAction, .remove(IndexPath(row: 0, section: 0)), "did Not remove cell, or not in the right location")
    }
    
}
