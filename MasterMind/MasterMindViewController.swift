//
//  MasterMindViewController.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class MasterMindViewController: UIViewController {

    let codeToMatch: CodeSet = CodeSet.random()
    var currentViewSelected: [Color] = []
    var rowViews: [RowView] = []
    var activeRow: RowView? = nil
    var colorArray: [Color] = []
    var activeIndex: Int = 7

    @IBOutlet weak var rowViewStack: UIStackView!
    @IBOutlet weak var masterMindLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    @IBAction func guessButtonTapped(_ sender: UIButton) { //creates a guess object and evaluates it to the codeToMatch displays the wining view or the next guessview
        activeIndex -= 1
        let guessCode = CodeSet(slot1: Slot(color: colorArray[0]), slot2: Slot(color: colorArray[1]), slot3: Slot(color: colorArray[2]), slot4: Slot(color: colorArray[3]))
        let guess = Guess(codeSet: guessCode)
        if (guess?.evaluate(code: codeToMatch))! {
            //send to WinScreen!
        }
        colorArray = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayStacks()
        activeRow = rowViews[activeIndex]
        setActiveRow()
        
        if colorArray.count == 4 {
            guessButton.isUserInteractionEnabled = true
        } else {
            guessButton.isUserInteractionEnabled = false
        }
        
    }

    // pulls up next very modally sends currentViewSelected
    func colorButtonPressed(_ sender: UIButton){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let colorPickVC: ColorPickViewController = storyBoard.instantiateViewController(withIdentifier: "ColorPicker") as! ColorPickViewController
        colorPickVC.activeView = self.activeRow
        colorPickVC.activeButton = sender
        self.present(colorPickVC, animated: true, completion: nil)
    }

    func displayStacks(){
        var rows: [RowView] = []
        while rows.count < 8 {
            let rowView = RowView(frame: CGRect.zero)
            rowView.slot1Button.addTarget(self, action: #selector(MasterMindViewController.colorButtonPressed(_:)), for: .touchUpInside)
            rowView.slot2Button.addTarget(self, action: #selector(MasterMindViewController.colorButtonPressed(_:)), for: .touchUpInside)
            rowView.slot3Button.addTarget(self, action: #selector(MasterMindViewController.colorButtonPressed(_:)), for: .touchUpInside)
            rowView.slot4Button.addTarget(self, action: #selector(MasterMindViewController.colorButtonPressed(_:)), for: .touchUpInside)
            rows.append(rowView)
            rowViewStack.addArrangedSubview(rowView)
            rowView.frame.size.width = rowViewStack.frame.size.width
        }
        self.rowViews = rows
    }

    
    //update userIneraction, and color
    func setActiveRow(){
        activeRow?.areAllInteractable()
        activeRow?.updateAllButtonColors(color: UIColor.lightGray.cgColor)
        
    }
    
    //update userIneraction, and color
    func deactivateRow(){
        activeRow?.areAllInteractable()
        activeRow?.updateAllButtonColors(color: UIColor.darkGray.cgColor)
    }
}

