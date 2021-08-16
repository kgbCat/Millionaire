//
//  QuestionsCareTaker.swift
//  Millionaire
//
//  Created by Anna Delova on 8/15/21.
//

import UIKit

class QuestionsCareTaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "MillionaireQuestions_key"
    
    func saveQuestions(question: [Question]) {
        do {
            let data = try encoder.encode(question)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadQuestions() -> [Question]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            
            print(error.localizedDescription)
            return nil
        }
    }
    
}
