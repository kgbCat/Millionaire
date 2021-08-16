//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Anna Delova on 8/15/21.
//

import UIKit

class AddQuestionViewController: UIViewController {


    @IBOutlet weak var newQuestionTextFild: UITextField! {
        didSet {
            newQuestionTextFild.delegate = self
        }
    }
 
    @IBOutlet weak var varA: UITextField!{
        didSet {
            varA.delegate = self
        }
    }
    @IBOutlet weak var varB: UITextField!{
        didSet {
            varB.delegate = self
        }
    }
    @IBOutlet weak var varC: UITextField!{
        didSet {
            varC.delegate = self
        }
    }
    @IBOutlet weak var varD: UITextField!{
        didSet {
            varD.delegate = self
        }
    }
    
    @IBOutlet weak var rightAns: UITextField!{
        didSet {
            rightAns.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func questionAdded(_ sender: Any) {
        guard
            let question = newQuestionTextFild.text,
            let varA = varA.text,
            let varB = varB.text,
            let varC = varC.text,
            let varD = varD.text,
            let rigthAns = rightAns.text
        else { return }
        if !(question == "" || rigthAns == "" || varA == "" || varB == "" || varC == "" || varD == "") {
            let varArray = [varA, varB, varC, varD]
            let newitem = Question(question: question, rightAnswer: rigthAns, answers: varArray)
            Game.shared.addQuestion(question: newitem)
            QuestionsCareTaker().saveQuestions(question: Game.shared.questionsAdded)
//            Game.shared.gameSession.questions.append(newitem)
//            Game.shared.cleareQuestions()
            clear()
        } else {
            showLoginError()
        }
    }

}
extension AddQuestionViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
            return true
    }

}
extension AddQuestionViewController {
    func showLoginError() {
        // create controller
        let alertController = UIAlertController(title: "Ошибка", message: "Нужно заполнить все поля", preferredStyle: .alert)
        // create button
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        // add button to the controller
        alertController.addAction(action)
        // display UIAlertController
        present(alertController, animated: true, completion: nil)
    }
    
    func clear() {
        newQuestionTextFild.text = ""
        varA.text = ""
        varB.text = ""
        varC.text = ""
        varD.text = ""
        rightAns.text = ""
        
    }
    
}
