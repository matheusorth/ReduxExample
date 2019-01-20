//
//  State.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import Foundation
import ReSwift

var store: Store<AppState> = Store<AppState>(reducer: appReducer, state: nil)

struct AppState: StateType, Equatable {
    var mainViewState: MainViewState = MainViewState()
}

func appReducer(action: Action, state: AppState?) -> AppState {
    return AppState(mainViewState: mainViewReducer(action: action, state: state?.mainViewState))
}
