//
//  QuizViewController.swift
//  FactAttack
//
//  Created by Ramesh Shrestha on 4/23/19.
//  Copyright © 2019 Ramesh Shrestha. All rights reserved.
//

import UIKit
class QuizViewController: UIViewController{
    
    @IBOutlet var Question: UILabel!
    @IBOutlet var Q: UILabel!
    @IBOutlet var Score: UILabel!
    
    @IBOutlet var Button1: UIButton!
    @IBOutlet var Button2: UIButton!
    @IBOutlet var Button3: UIButton!
    @IBOutlet var Button4: UIButton!
    @IBOutlet var Fifty: UIButton!
    @IBOutlet var ShowAnswer: UIButton!
    
    var count: Int = 0
    var score: Int = 0
    
    var Answer = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RandomQuestions()
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "Result")  {
            if let destVC = segue.destination as? ResultViewController {
                destVC.ScoreText = score
            }
        }
    }
    @IBAction func ShowAnswerA(_ sender: Any) {
        if score >= 3 {
            score -= 3
            let alert = UIAlertController(title: "Correct!", message: Answer, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }else{
            let alert = UIAlertController(title: "Sorry", message: "You do not have enought points", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    @IBAction func FiftyA(_ sender: Any) {
        if score >= 1 {
            score -= 1
            if Answer == "2"{
                let alert = UIAlertController(title: "Answers", message: "3" + " OR " + Answer, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }else{
                let alert = UIAlertController(title: "Answers", message: "2" + " OR " + Answer, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }else{
            let alert = UIAlertController(title: "Sorry", message: "You do not have enought points", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

    fileprivate func handleSelection(correctAnswer: String) {
        if  Answer == correctAnswer {
            score += 1
            let alert = UIAlertController (title: "Correct!", message: "", preferredStyle:.alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (x) in  self.RandomQuestions() })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController (title: "Wrong!", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: { (x) in  self.RandomQuestions() })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func Button1A(_ sender: Any) {
        handleSelection(correctAnswer: "1")
    }
    @IBAction func Button2A(_ sender: UIButton) {
        handleSelection(correctAnswer: "2")
    }
    @IBAction func Button3A(_ sender: Any) {
        handleSelection(correctAnswer: "3")
    }
    @IBAction func Button4A(_ sender: Any) {
        handleSelection(correctAnswer: "4")
    }
    func RandomQuestions(){
        var RandomNumber = arc4random() % 20
        RandomNumber += 1
        if count == 10 {
            performSegue(withIdentifier: "Result", sender: score)
        }
        count += 1
        switch(RandomNumber){
        case 1:
            Q.text = "Q\(count)"
            Score.text = "Points: \(score)"
            Question.text = "How many colors are there in a rainbow?"
            Button1.setTitle("7", for: .normal)
            Button2.setTitle("5", for: .normal)
            Button3.setTitle("13", for: .normal)
            Button4.setTitle("8", for: .normal)
            Answer = "1"
            break
        case 2:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "What so you call a span of one hundred years?"
            Button1.setTitle("Millennium", for: .normal)
            Button4.setTitle("Decade", for: .normal)
            Button3.setTitle("Eon", for: .normal)
            Button2.setTitle("Century", for: .normal)
            Answer = "2"
            break
        case 3:
            Score.text = "Points:\(score)"
            Q.text = "Q\(count)"
            Question.text = "How many degrees are in a circle?"
            Button3.setTitle("360", for: .normal)
            Button2.setTitle("45", for: .normal)
            Button1.setTitle("90", for: .normal)
            Button4.setTitle("180", for: .normal)
            Answer = "3"
            break
        case 4:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "What do you call the dessert made with ice cream and cake topped with meringue?"
            Button4.setTitle("Baked Alaska", for: .normal)
            Button2.setTitle("Eclair", for: .normal)
            Button3.setTitle("Donut", for: .normal)
            Button1.setTitle("Ice Cream Cake", for: .normal)
            Answer = "4"
            break
        case 5:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "How many strings does a cello have?"
            Button1.setTitle("4", for: .normal)
            Button2.setTitle("5", for: .normal)
            Button3.setTitle("6", for: .normal)
            Button4.setTitle("8", for: .normal)
            Answer = "1"
            break
        case 6:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "Who wrote The Grapes of Wrath?"
            Button2.setTitle("John Steinbeck", for: .normal)
            Button1.setTitle("J.K. Rowling", for: .normal)
            Button3.setTitle("George RR Martin", for: .normal)
            Button4.setTitle("J.R.R Tolkien", for: .normal)
            Answer = "2"
            break
        case 7:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "According to Greek mythology, who stole fire for mankind's benefit?"
            Button3.setTitle("Prometheus", for: .normal)
            Button2.setTitle("Zeus", for: .normal)
            Button1.setTitle("Atlas", for: .normal)
            Button4.setTitle("Persephone", for: .normal)
            Answer = "3"
            break
        case 8:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "How many lines does a limerick have?"
            Button4.setTitle("5", for: .normal)
            Button2.setTitle("3", for: .normal)
            Button3.setTitle("4", for: .normal)
            Button1.setTitle("7", for: .normal)
            Answer = "4"
            break
        case 9:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "In Portugal, what object is traditional thrown at friends in celebration of April Fool's Day?"
            Button1.setTitle("Flour", for: .normal)
            Button2.setTitle("Salt", for: .normal)
            Button3.setTitle("Wine", for: .normal)
            Button4.setTitle("Tomato", for: .normal)
            Answer = "1"
            break
        case 10:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "What is the only snake in the world that builds nest for its eggs?"
            Button2.setTitle("King Cobra", for: .normal)
            Button1.setTitle("Python",for: .normal)
            Button3.setTitle("Anaconda",for: .normal)
            Button4.setTitle("Coral",for: .normal)
            Answer = "2"
            break
        case 11:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "Which gland in the human body regulates metabolism?"
            Button3.setTitle("Thyroid",for: .normal)
            Button2.setTitle("Pituitary",for: .normal)
            Button1.setTitle("Pineal",for: .normal)
            Button4.setTitle("Adrenal",for: .normal)
            Answer = "3"
            break
        case 12:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "Which famous toy manufacturer is also the world's largest tire manufacturer by units produced?"
            Button4.setTitle("Lego",for: .normal)
            Button2.setTitle("Mattel",for: .normal)
            Button3.setTitle("Bandai",for: .normal)
            Button1.setTitle("Nerf",for: .normal)
            Answer = "4"
            break
        case 13:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "How many moons does Jupiter have?"
            Button1.setTitle("67",for: .normal)
            Button2.setTitle("4",for: .normal)
            Button3.setTitle("15",for: .normal)
            Button4.setTitle("86",for: .normal)
            Answer = "1"
            break
        case 14:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "How many states are there in the United States of America?"
            Button2.setTitle("50",for: .normal)
            Button1.setTitle("34",for: .normal)
            Button3.setTitle("49",for: .normal)
            Button4.setTitle("52",for: .normal)
            Answer = "2"
            break
        case 15:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "Where is the smallest bone in the body?"
            Button3.setTitle("Ear",for: .normal)
            Button2.setTitle("Hand",for: .normal)
            Button1.setTitle("Foot",for: .normal)
            Button4.setTitle("Spine",for: .normal)
            Answer = "3"
            break
        case 16:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "Who painted the Mona Lisa?"
            Button4.setTitle("Da Vinci",for: .normal)
            Button2.setTitle("Van Gogh",for: .normal)
            Button3.setTitle("Rembrandt",for: .normal)
            Button1.setTitle("Picaso",for: .normal)
            Answer = "4"
            break
        case 17:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "In what country does the Bullet Train run?"
            Button1.setTitle("Japan",for: .normal)
            Button2.setTitle("China",for: .normal)
            Button3.setTitle("France",for: .normal)
            Button4.setTitle("Canada",for: .normal)
            Answer = "1"
            break
        case 18:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "What is Earth's largest continent?"
            Button2.setTitle("Asia",for: .normal)
            Button1.setTitle("Africa",for: .normal)
            Button3.setTitle("Europe",for: .normal)
            Button4.setTitle("Antarctica",for: .normal)
            Answer = "2"
            break
        case 19:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "What country can you visit Machu Pichu?"
            Button3.setTitle("Peru",for: .normal)
            Button2.setTitle("Columbia",for: .normal)
            Button1.setTitle("Chile",for: .normal)
            Button4.setTitle("Bolivia",for: .normal)
            Answer = "3"
            break
        case 20:
            Score.text = "Points: \(score)"
            Q.text = "Q\(count)"
            Question.text = "What type of flowers produce vanilla pods?"
            Button4.setTitle("Orchids",for: .normal)
            Button2.setTitle("Lilies",for: .normal)
            Button3.setTitle("Roses",for: .normal)
            Button1.setTitle("Chrysanthemum",for: .normal)
            Answer = "4"
            break
        default:
            break
        }
    }
}
