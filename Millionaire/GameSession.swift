

import UIKit

class GameSession {
    
    private var questions = [Question]()
    
    init() {
      //list of questions
        let question1 = Question(
            question: " Кто из этих философов в 1864 году написал музыку на стихи А.С. Пушкина «Заклинание» и «Зимний вечер»?",
            rightAnswer: "Ницше",
            answers:["Юнг", "Гегель", "Ницше", "Шопенгауэр"]
        )
        let question2 = Question(
            question: " Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
            rightAnswer: "Два",
            answers:["Один", "Два", "Три", "Четыре"]
        )
        let question3 = Question(
            question: "  Кто 1-м получил Нобелевскую премию по литературе?",
            rightAnswer: "Поэт",
            answers:["Романист", "Драматург", "Поэт", "Эссеист"]
        )
        let question4 =  Question(
            question: " С какой буквы начинаются слова, опубликованные в 16-м томе последнего издания Большой советской энциклопедии?",
            rightAnswer: "М",
            answers:["М", "Н", "О", "П"]
        )
        let question5 =  Question(
            question: " Кто из перечисленных был пажом во времена Екатерины II?",
            rightAnswer: "А.Н. Радищев",
            answers:["Д.И. Фонвизин", "Г.Р. Державин", "А.Н. Радищев", "Н.М. Карамзин"]
        )
        
      questions = [question1, question2, question3, question4, question5]
    }
    
    var auditoryHelpCount = 0
    var friendHelpCount = 0
    var result = 0
    let careTaker = CareTaker()

    func getQuestions() -> [Question] {
        return questions
    }
    func displayQuestion(question: Question, label: UILabel) {
        label.text = question.question
        
    }
    func auditoryHelp(question: Question) {

        if auditoryHelpCount == 0 {
            auditoryHelpCount += 1
            _ =  question.helpOfAuditory(variants: question.answers)
           
        } else {
            //notify the user
            print("Нет нет, своей подсказкой вы уже воспользовались")
        }
    }
    func friendHelp(question: Question)  {
        
        if friendHelpCount > 0 {
            //notify the user
            print("К сожалению друг уже не сможет Вам помочь")
        } else {
            friendHelpCount += 1
            _ = question.callToFriend(variants: question.answers)
        }
    }
    func check(_ sender: UIButton, question: Question) -> Bool {
        if sender.titleLabel?.text == String(question.rightAnswer) {
            sender.backgroundColor = .green
            result += 100000
            return true
        }
        else {
            sender.backgroundColor = .red
            print("Вы проиграли!")
            let record = Record(date: Date(), record: result)
            Game.shared.addRecord(record: record)
            careTaker.saveRecords(record: Game.shared.records)
            return false
        }
    }
    func youWin() {
        let record = Record(date: Date(), record: result)
        Game.shared.addRecord(record: record)
        careTaker.saveRecords(record: Game.shared.records)
        print("Вы пожалуй самый умный человек на планете! Вы теперь миллионер!))")
    }
 
    
}
