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
    @IBOutlet weak var rowViewStack: UIStackView!
    let rowViews: [RowView] = []
    @IBOutlet weak var masterMindLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayStacks()
        
    }

    // func buttonPressed(UIButton){} pulls up next very modally sends currentViewSelected

    //func guessButtonPressed() creates a guess object and evaluates it to the codeToMatch displays the wining view or the next guessview

    func displayStacks(){
        var rowArray: [RowView] = []
        while rowArray.count < 8 {
            let rowView = RowView(frame: CGRect.zero)
            
            rowArray.append(rowView)
            rowViewStack.addArrangedSubview(rowView)
            rowView.frame.size.width = rowViewStack.frame.size.width
        }
        
    }

}

