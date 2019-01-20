//
//  MainAction.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import Foundation
import ReSwift

enum MainAction: Action {
    case initialize
    case addConsumer
    case addProducer
    case insertProduct
    case removeProduct
}
