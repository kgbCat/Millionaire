//
//  RecordsTableViewController.swift
//  Millionaire
//
//  Created by Anna Delova on 8/7/21.
//

import UIKit

class RecordsTableViewController: UITableViewController {
    
    var records = Game.shared.records

    override func viewDidLoad() {
        super.viewDidLoad()
        print(records)
        
        // register nib for recordCell
        let nib = UINib(nibName: "RecordTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "recordCell")
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as? RecordTableViewCell
        else { return UITableViewCell() }
        let record = records[indexPath.row]

        // Configure the cell...
        cell.configure(date: record.date.description, score: record.record)

        return cell
    }
    
}
