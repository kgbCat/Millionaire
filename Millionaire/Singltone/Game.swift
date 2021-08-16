//
//  Game.swift
//  Millionaire
//
//  Created by Anna Delova on 8/6/21.
//

import UIKit

class Game {
    
    var segment: Int
    var difficulty: Difficulty
    static let shared = Game()
  
    private var careTaker = CareTaker() {
        didSet {
            careTaker.saveRecords(record: records)
        }
    }
    
    private var careTakerQuestions = QuestionsCareTaker() {
        didSet {
            careTakerQuestions.saveQuestions(question: questionsAdded)
        }
    }

    var gameSession = GameSession()
    private(set) var records: [Record] = []
    private(set) var questionsAdded: [Question] = []
    
    private init() {
        records = careTaker.loadecords() ?? []
        questionsAdded = careTakerQuestions.loadQuestions() ?? []
        segment = gameSession.segmentChecked
        difficulty = gameSession.setDifficulty(segment)
        
        
    }
    func addRecord(record: Record) {
        records.append(record)
    }
    
    func clearecords(){
        records.removeAll()
    }
    func addQuestion(question: Question) {
        questionsAdded.append(question)
    }
    
    func cleareQuestions(){
        questionsAdded.removeAll()
    }

}
