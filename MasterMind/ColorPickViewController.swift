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
    var tempColor: CGColor?
    var colorsSelected: [CGColor] {
        var array: [CGColor] = []
        array.append((activeView?.slot1Button.layer.backgroundColor)!)
        array.append((activeView?.slot2Button.layer.backgroundColor)!)
        array.append((activeView?.slot3Button.layer.backgroundColor)!)
        array.append((activeView?.slot4Button.layer.backgroundColor)!)
        return array
    }
    
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
        activeButton?.layer.backgroundColor = tempColor
        self.dismiss(animated: true, completion: nil)
    }
    
    //make buttons inactive if color already used
    @IBAction func colorSelected(_ sender: UIButton) {
        switch sender {
        case firstColorButton:
            activeButton?.layer.backgroundColor = firstColorButton.layer.backgroundColor
        case secondColorButton:
            //colorsSelected.append(.pink)
            activeButton?.layer.backgroundColor = secondColorButton.layer.backgroundColor
        case thirdColorButton:
            //colorsSelected.append(.blue)
            activeButton?.layer.backgroundColor = thirdColorButton.layer.backgroundColor
        case fourthColorButton:
            //colorsSelected.append(.peach)
            activeButton?.layer.backgroundColor = fourthColorButton.layer.backgroundColor
        case fifthColorButton:
            //colorsSelected.append(.mint)
            activeButton?.layer.backgroundColor = fifthColorButton.layer.backgroundColor
        case sixthColorButton:
            //colorsSelected.append(.yellow)
            activeButton?.layer.backgroundColor = sixthColorButton.layer.backgroundColor
        case seventhColorButton:
            //colorsSelected.append(.orange)
            activeButton?.layer.backgroundColor = seventhColorButton.layer.backgroundColor
        case eigthColorButton:
            //colorsSelected.append(.purple)
            activeButton?.layer.backgroundColor = eigthColorButton.layer.backgroundColor
        default:
            return
        }
        activeView?.colorsSelected = self.colorsSelected
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewStyle()
        tempColor = activeButton?.layer.backgroundColor
        activeButton?.layer.backgroundColor = UIColor.lightGray.cgColor
        for color in colorsSelected{
            if color == firstColorButton.layer.backgroundColor {
                firstColorButton.isUserInteractionEnabled = false
                firstColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == secondColorButton.layer.backgroundColor {
                secondColorButton.isUserInteractionEnabled = false
                secondColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == thirdColorButton.layer.backgroundColor {
                thirdColorButton.isUserInteractionEnabled = false
                thirdColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == fourthColorButton.layer.backgroundColor {
                fourthColorButton.isUserInteractionEnabled = false
                fourthColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == fifthColorButton.layer.backgroundColor {
                fifthColorButton.isUserInteractionEnabled = false
                fifthColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == sixthColorButton.layer.backgroundColor {
                sixthColorButton.isUserInteractionEnabled = false
                sixthColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == seventhColorButton.layer.backgroundColor {
                seventhColorButton.isUserInteractionEnabled = false
                seventhColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            } else if color == eigthColorButton.layer.backgroundColor {
                eigthColorButton.isUserInteractionEnabled = false
                eigthColorButton.layer.backgroundColor = UIColor.lightGray.cgColor
            }
        }
        
    }

    func setUpViewStyle(){
        pickColorLabel.layer.cornerRadius = 10
        pickColorLabel.layer.backgroundColor = UIColor(red: 102/255, green: 104/255, blue: 104/255, alpha: 1.0).cgColor
        innerView.layer.cornerRadius = 20
        firstColorButton.layer.cornerRadius = 20
        firstColorButton.layer.backgroundColor = Color.violet.color
        secondColorButton.layer.cornerRadius = 20
        secondColorButton.layer.backgroundColor = Color.pink.color
        thirdColorButton.layer.cornerRadius = 20
        thirdColorButton.layer.backgroundColor = Color.blue.color
        fourthColorButton.layer.cornerRadius = 20
        fourthColorButton.layer.backgroundColor = Color.peach.color
        fifthColorButton.layer.cornerRadius = 20
        fifthColorButton.layer.backgroundColor = Color.mint.color
        sixthColorButton.layer.cornerRadius = 20
        sixthColorButton.layer.backgroundColor = Color.yellow.color
        seventhColorButton.layer.cornerRadius = 20
        seventhColorButton.layer.backgroundColor = Color.orange.color
        eigthColorButton.layer.cornerRadius = 20
        eigthColorButton.layer.backgroundColor = Color.purple.color
    }

}
