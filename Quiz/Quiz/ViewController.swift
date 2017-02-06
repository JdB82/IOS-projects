//
//  ViewController.swift
//  Quiz
//
//  Created by Jeroen de Bie on 02/02/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var anserlabel: UILabel!
    
    let questions: [String] = [
        "What is 934+2334?",
        "What is the capital France?",
        "Who sings 'The show must go on!'?"
    ]
    let answers: [String] = [
        "3268",
        "Paris",
        "Freddie Mercury"
    ]
    var currentQuestionIndex: Int = 0
    

    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        anserlabel.text = "???"

    }

    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        anserlabel.text = answer
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
}
