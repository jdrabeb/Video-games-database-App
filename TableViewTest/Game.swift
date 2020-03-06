//
//  Game.swift
//  TableViewTest
//
//  Created by Rabeb Jaouadi on 05/03/2020.
//  Copyright © 2020 __epita__. All rights reserved.
//

import Foundation

class GameResult: Codable {
    let results: [Game]
}

class Game: Codable {
    let id: Int
    let name: String
    let released: String
    let background_image: String
}
