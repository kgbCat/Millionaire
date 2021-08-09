//
//  CareTaker.swift
//  Millionaire
//
//  Created by Anna Delova on 8/9/21.
//

import UIKit

class CareTaker {
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "Millionaire_key"
    
    func saveRecords(record: [Record]) {
        do {
            let data = try encoder.encode(record)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadecords() -> [Record]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        do {
            return try decoder.decode([Record].self, from: data)
        } catch {
            
            print(error.localizedDescription)
            return nil
        }
    }
}
