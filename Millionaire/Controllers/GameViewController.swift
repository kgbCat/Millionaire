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
    @IBOutlet weak var observequestionLabel: UILabel!
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReceived), name: Notification.Name("currentQuestionNumber"), object: nil)
        checkStrategy()
        buttonArr = [buttonA, buttonB, buttonC, buttonD]
        setupButton(buttons: buttonArr, question: questions[i])
        game.displayQuestion(question: questions[i], label: questionLabel, numOfQuestion: i)
 
    }

    @IBAction func auditoryHelpButton(_ sender: UIButton) {
        if (i <= questions.count) {
            game.auditoryHelp(question: questions[i])
        }
    }
    @IBAction func friendHelpButton(_ sender: UIButton) {
        if (i <= questions.count) {
            game.friendHelp(question: questions[i])
        }
    }
    @IBAction func help50to50Button(_ sender: UIButton) {
        if (i <= questions.count) {
            // keep right value and 1 wrong
            let indexesTodisplay = game.help50to50(question: questions[i])
            if !indexesTodisplay.isEmpty {                    
                for b in buttonArr {
                    if b.tag != indexesTodisplay[0] && b.tag != indexesTodisplay[1] {
                        b.backgroundColor = .red
                    }
                }
            }
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let check = game.check(sender, question: questions[i])
        // if the answer is correct
        if (check == true) && (i < questions.count - 1) {
            i += 1
            // display the next question and set buttons with variants
            game.displayQuestion(question: questions[i], label: questionLabel, numOfQuestion: i)
          
            setupButton(buttons: buttonArr, question: questions[i])
        } else if check == false {
            // save record and get back to main
            self.navigationController?.popViewController(animated: true)
//            dismiss(animated: true, completion: nil)
        } else {
            // all questions asked correctly
            // save record and get back to main
            // print congrats
            game.youWin()    
            self.navigationController?.popViewController(animated: true)
//            dismiss(animated: true, completion: nil)
        }
        
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
    
    func checkStrategy() {
        if Game.shared.difficulty == .shuffled {
            questions = ShuffledQuestions().order()
        } else {
            questions = OrderedQuestions().order()
        }
        
    }
    
    @objc func notificationReceived() {
        observequestionLabel.text = "вопрос .\(game.numberOfQuestion + 1) показатель: \(game.percentage) %"
    }

}

    

