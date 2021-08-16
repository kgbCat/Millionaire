//
//  SequenceOrRandomProtocol.swift
//  Millionaire
//
//  Created by Anna Delova on 8/11/21.
//

import Foundation

protocol Odered&Shuffled {
    func order(questions: [Question]) -> [Question]
}
