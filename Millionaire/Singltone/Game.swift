//
//  Game.swift
//  Millionaire
//
//  Created by Anna Delova on 8/6/21.
//

import UIKit

class Game {
    
    static let shared = Game()
    private var careTaker = CareTaker() {
        didSet {
            careTaker.saveRecords(record: records)
        }
    }
    var gameSession = GameSession()
    private(set) var records: [Record] = []
    
    private init() {
        records = careTaker.loadecords() ?? []
    }
    func addRecord(record: Record) {
        records.append(record)
    }
    
    func clearecords(){
        records.removeAll()
    }
}
