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
    
    @IBOutlet weak var lastMoveLabel: UILabel!
    @IBOutlet weak var lastSlot1Label: UILabel!
    @IBOutlet weak var lastSlot2Label: UILabel!
    @IBOutlet weak var lastSlot3Label: UILabel!
    @IBOutlet weak var lastSlot4Label: UILabel!
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
        lastMoveLabel.layer.masksToBounds = true
        lastMoveLabel.layer.cornerRadius = 12
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
            lastMoveLabel.isHidden = true
            lastSlot1Label.isHidden = true
            lastSlot2Label.isHidden = true
            lastSlot3Label.isHidden = true
            lastSlot4Label.isHidden = true
        } else {
            wonOrLostLabel.text = "You lost"
            let code = delegate?.guess?.codeSet
            lastSlot1Label.layer.masksToBounds = true
            lastSlot2Label.layer.masksToBounds = true
            lastSlot3Label.layer.masksToBounds = true
            lastSlot4Label.layer.masksToBounds = true
            lastSlot1Label.layer.cornerRadius = 20
            lastSlot2Label.layer.cornerRadius = 20
            lastSlot3Label.layer.cornerRadius = 20
            lastSlot4Label.layer.cornerRadius = 20
            lastSlot1Label.backgroundColor = code?.slot1.color.color
            lastSlot2Label.backgroundColor = code?.slot2.color.color
            lastSlot3Label.backgroundColor = code?.slot3.color.color
            lastSlot4Label.backgroundColor = code?.slot4.color.color
            
        }
    }

    @IBAction func playAgainPressed(_ sender: UIButton) {
        //reset MasterMindView Controller
        self.delegate?.reset()
        self.dismiss(animated: true, completion: nil)
    }
    

    

}
