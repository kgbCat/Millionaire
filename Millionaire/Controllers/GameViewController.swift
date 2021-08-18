//
//  GameViewController.swift
//  Millionaire
//
//  Created by Anna Delova on 8/6/21.
//

import UIKit

class GameViewController: UIViewController {

    var questions = [Question]()
    var buttonArr = [UIButton]()
    let game = GameSession()
    var i = 0
 
    // MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!

    @IBAction func auditoryHelpButton(_ sender: UIButton) {
        if (i < questions.count - 1) {
            game.auditoryHelp(question: questions[i])
        }
    }
    @IBAction func friendHelpButton(_ sender: UIButton) {
        if (i < questions.count - 1) {
            game.friendHelp(question: questions[i])
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let check = game.check(sender, question: questions[i])
        // if the answer is correct
        if (check == true) && (i < questions.count - 1) {
            i += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.game.displayQuestion(question: self.questions[self.i], label: self.questionLabel)
            self.setupButton(buttons: self.buttonArr, question: self.questions[self.i])
            }
            // display the next question and set buttons with variants
//            game.displayQuestion(question: questions[i], label: questionLabel)
//            setupButton(buttons: buttonArr, question: questions[i])
        } else if check == false {
            // save record and get back to main
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.dismiss(animated: true, completion: nil)
            }
//            dismiss(animated: true, completion: nil)
        } else {
            // all questions asked correctly
            // save record and get back to main
            // print congrats
            game.youWin()
            dismiss(animated: true, completion: nil)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Game.shared.gameSession = game
        questions = game.getQuestions()
        buttonArr = [buttonA, buttonB, buttonC, buttonD]
        setupButton(buttons: buttonArr, question: questions[i])
        game.displayQuestion(question: questions[i], label: questionLabel)
 
    }

}
extension GameViewController {
    
    func setupButton(buttons: [UIButton], question: Question) {
        let answers = question.answers
        var i = 0
        for button in buttons {
            button.layer.cornerRadius = button.frame.height / 2
            button.backgroundColor = .blue
//            button.backgroundColor = button.backgroundColor == UIColor.blue ? UIColor.green : UIColor.blue
            button.setTitle(answers[i], for: .normal)
            i += 1
            
        }
  
    }

}

    

