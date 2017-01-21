//
//  ColorPickViewController.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/21/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class ColorPickViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    
    var activeView: RowView?
    var activeButton: UIButton?
    var colorsSelected: [Color] = []
    
    @IBOutlet weak var pickColorLabel: UILabel!
    @IBOutlet weak var firstColorButton: UIButton!
    @IBOutlet weak var secondColorButton: UIButton!
    @IBOutlet weak var thirdColorButton: UIButton!
    @IBOutlet weak var fourthColorButton: UIButton!
    @IBOutlet weak var fifthColorButton: UIButton!
    @IBOutlet weak var sixthColorButton: UIButton!
    @IBOutlet weak var seventhColorButton: UIButton!
    @IBOutlet weak var eigthColorButton: UIButton!

    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func colorSelected(_ sender: UIButton) {
        switch sender {
        case firstColorButton:
            colorsSelected.append(.mint)
            activeButton?.layer.backgroundColor = firstColorButton.layer.backgroundColor
            //send color information back to masterview
        case secondColorButton:
            colorsSelected.append(.mint)
        case thirdColorButton:
            colorsSelected.append(.mint)
        case fourthColorButton:
            colorsSelected.append(.mint)
        case fifthColorButton:
            colorsSelected.append(.mint)
        case sixthColorButton:
            colorsSelected.append(.mint)
        case seventhColorButton:
            colorsSelected.append(.mint)
        case eigthColorButton:
            colorsSelected.append(.mint)
        default:
            return
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // make buttons relating to colors selected unavalable
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewStyle()
        
       
    }

    func setUpViewStyle(){
        innerView.layer.cornerRadius = 20
        firstColorButton.layer.cornerRadius = 20
        secondColorButton.layer.cornerRadius = 20
        thirdColorButton.layer.cornerRadius = 20
        fourthColorButton.layer.cornerRadius = 20
        fifthColorButton.layer.cornerRadius = 20
        sixthColorButton.layer.cornerRadius = 20
        seventhColorButton.layer.cornerRadius = 20
        eigthColorButton.layer.cornerRadius = 20
    }

}
