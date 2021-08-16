//
//  OrderedQuestions.swift
//  Millionaire
//
//  Created by Anna Delova on 8/11/21.
//

import Foundation

class OrderedQuestions: OrderedShuffledProtocol {
    let questions = Game.shared.gameSession.getQuestions()
    
    func order() -> [Question] {
        questions
    }

}
