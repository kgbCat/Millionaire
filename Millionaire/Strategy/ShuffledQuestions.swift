//
//  SequentQuestions.swift
//  Millionaire
//
//  Created by Anna Delova on 8/11/21.
//

import Foundation

class ShuffledQuestions: OrderedShuffledProtocol {
    
    
    let questions = Game.shared.gameSession.getQuestions()
    
    func order() -> [Question] {
        questions.shuffled()

    }
    

    
}
