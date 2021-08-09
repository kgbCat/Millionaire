//
//  File.swift
//  Millionaire
//
//  Created by Anna Delova on 8/6/21.
//

import Foundation

struct Question {
     var question: String
    var rightAnswer: String
     var answers: [String]
    
    
    func callToFriend(variants: [String]) -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(variants.count)))
        let friendAnwer = variants[randomIndex]
        print("Привет, Я думаю что правильный ответ \(friendAnwer)")
        return friendAnwer
        
    }
    func helpOfAuditory(variants: [String]) -> String {
        let randomIndex = Int(arc4random_uniform(UInt32(variants.count)))
        let auditoryanswer = variants[randomIndex]
        print("Зрители думают что правильный ответ \(auditoryanswer)")
        return auditoryanswer
        
    }

}
// right answers C B C A C
