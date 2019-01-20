//
//  Model.swift
//  ReduxFirstTestProj
//
//  Created by Matheus on 13.01.19.
//  Copyright © 2019 matheusOrth. All rights reserved.
//

import Foundation

protocol Character {
    static var intervalOfAction: Int { get }
    var type: CharacterType { get }
}

enum CharacterType {
    case producer, consumer
}

class Producer: Character {
    static var intervalOfAction: Int = 3
    var type: CharacterType = .producer
}

class Consumer: Character {
    static var intervalOfAction: Int = 4
    var type: CharacterType = .consumer
}
