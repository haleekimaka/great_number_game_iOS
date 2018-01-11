//
//  ViewController.swift
//  GreatNumberGame
//
//  Created by Arin Halicki on 1/10/18.
//  Copyright © 2018 Arin Halicki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var outcome: String = ""
    var why: String = ""
    var number: Int = 0
    
    @IBOutlet weak var enteredGuess: UITextField!
    
    @IBAction func submitGuessButtonTapped(_ sender: UIButton) {

        let guess = Int(enteredGuess.text!)
        
        // create the alert
        if guess! > number {
            outcome = "Incorrect"
            why = "\(guess!) is too high."
        }
        else if guess! < number {
            outcome = "Incorrect"
            why = "\(guess!) is too low."
        }
        else if guess! == number {
            outcome = "Correct"
            why = "\(guess!) is the number!"
            number = 0
        }
        
        let alert = UIAlertController(title: outcome, message: why, preferredStyle: UIAlertControllerStyle.alert)
        
        let subview = (alert.view.subviews.first!) as UIView

        // add an action (button)
        if outcome == "Incorrect" {
            subview.backgroundColor = .red
            alert.addAction(UIAlertAction(title: "Guess Again", style: UIAlertActionStyle.default, handler: nil))
        }
        else if outcome == "Correct" {
            subview.backgroundColor = .green
            alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: nil))
        }


        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        enteredGuess.text = ""
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        number = Int(arc4random_uniform(100)+1)
        print(number)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

