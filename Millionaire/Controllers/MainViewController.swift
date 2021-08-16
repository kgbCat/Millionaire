//
//  MainViewController.swift
//  Millionaire
//
//  Created by Anna Delova on 8/6/21.
//

import UIKit

class MainViewController: UIViewController {

   
    let game = GameSession()
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
    }

    @IBOutlet weak var chooseDifficultySC: UISegmentedControl!
    
    @IBAction func chooseDiffiicultyTapped(_ sender: Any) {

        if chooseDifficultySC.selectedSegmentIndex == 1 {
            Game.shared.difficulty = game.setDifficulty(1)
        } else {
            Game.shared.difficulty = game.setDifficulty(0)

        }
    }
    

    @IBAction func AddQuestionTapped(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }




}

