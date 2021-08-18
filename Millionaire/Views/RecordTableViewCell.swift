//
//  RecordTableViewCell.swift
//  Millionaire
//
//  Created by Anna Delova on 8/7/21.
//

import UIKit

class RecordTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(date: Date, score: Int) {
        
        self.date.text = date.description
        self.message.text = "Вы выигарли \(score) рублей"
    }
    
}
