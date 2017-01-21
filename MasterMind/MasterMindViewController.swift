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
    let rowViews: [RowView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayRows()
        
    }
    
    //func createRowViews()  append to rowViewArray sets location of

    // func buttonPressed(UIButton){} pulls up next very modally sends currentViewSelected

    //func guessButtonPressed() creates a guess object and evaluates it to the codeToMatch displays the wining view or the next guessview

    func displayRows(){
        var rowArray: [RowView] = []
        while rowArray.count < 8 {
            let rowView = RowView()
            rowView.initializeView()
            rowArray.append(rowView)
        }
        
        let stackView = UIStackView(arrangedSubviews: rowArray)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 0
       // stackView.translatesAutoresizingMaskIntoConstraints = false what does this do?
        self.view.addSubview(stackView)
    }

}

