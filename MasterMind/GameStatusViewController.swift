//
//  GameStatusViewController.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/22/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

protocol GameStatusViewControllerDelegate {
    var codeToMatch: CodeSet {get}
    var guess: Guess? {get}
    func reset()
    
}

class GameStatusViewController: UIViewController {

    var delegate: GameStatusViewControllerDelegate?
    var slot1: Slot?
    var slot2: Slot?
    var slot3: Slot?
    var slot4: Slot?
    
    @IBOutlet weak var wonOrLostLabel: UILabel!
    @IBOutlet weak var slot1Label: UILabel!
    @IBOutlet weak var slot2Label: UILabel!
    @IBOutlet weak var slot3Label: UILabel!
    @IBOutlet weak var slot4Label: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var theCodeIsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slot1 = delegate?.codeToMatch.slot1
        slot2 = delegate?.codeToMatch.slot2
        slot3 = delegate?.codeToMatch.slot3
        slot4 = delegate?.codeToMatch.slot4
        theCodeIsLabel.layer.cornerRadius = 12
        theCodeIsLabel.layer.masksToBounds = true
        wonOrLostLabel.layer.cornerRadius = 17
        wonOrLostLabel.layer.masksToBounds = true
        slot1Label.layer.cornerRadius = 20
        slot1Label.layer.masksToBounds = true
        slot1Label.backgroundColor = (slot1?.color.color)!
        slot2Label.layer.cornerRadius = 20
        slot2Label.layer.masksToBounds = true
        slot2Label.backgroundColor = (slot2?.color.color)!
        slot3Label.layer.cornerRadius = 20
        slot3Label.layer.masksToBounds = true
        slot3Label.backgroundColor = (slot3?.color.color)!
        slot4Label.layer.cornerRadius = 20
        slot4Label.layer.masksToBounds = true
        slot4Label.backgroundColor = (slot4?.color.color)!
        playAgainButton.layer.cornerRadius = 18
        if (delegate?.guess?.evaluate(code:  (delegate?.codeToMatch)!))! {
            wonOrLostLabel.text = "You Won!"
        } else {
            wonOrLostLabel.text = "You lost"
        }
    }

    @IBAction func playAgainPressed(_ sender: UIButton) {
        //reset MasterMindView Controller
        self.delegate?.reset()
        self.dismiss(animated: true, completion: nil)
    }
    

    

}
