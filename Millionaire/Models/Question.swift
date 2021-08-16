//
//  File.swift
//  Millionaire
//
//  Created by Anna Delova on 8/6/21.
//

import Foundation

struct Question: Codable {
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
    func helpOf50to50(variants: [String], right: String) -> [Int] {
        var rightAnswerIndex = 0
        for (i,v) in variants.enumerated() {
            if v == right{
                rightAnswerIndex = i
            }
        }
        var wrongAnswerIndex = 0
        for (i,v) in variants.enumerated() {
            if v != right {
                wrongAnswerIndex = i
            }
        }
        let indexesTodisplay = [rightAnswerIndex, wrongAnswerIndex]
        print("Компьютер убрал два неправильных ответа")
        return indexesTodisplay
        
    }

}

