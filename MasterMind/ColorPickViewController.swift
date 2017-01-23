//
//  ColorPickViewController.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/21/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

protocol ColorPickerViewControllerDelegate {
    var activeRow: RowView? {get}
    var selectedColor: UIColor? {get set}
}

class ColorPickViewController: UIViewController {

    @IBOutlet weak var innerView: UIView!
    var delegate: ColorPickerViewControllerDelegate?
    var activeView: RowView?
    var activeButton: UIButton?
    var tempColor: UIColor?
    var colorsSelected: [UIColor] {
        var array: [UIColor] = []
        array.append((activeView?.slot1Button.backgroundColor)!)
        array.append((activeView?.slot2Button.backgroundColor)!)
        array.append((activeView?.slot3Button.backgroundColor)!)
        array.append((activeView?.slot4Button.backgroundColor)!)
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
        activeButton?.backgroundColor = tempColor
        self.dismiss(animated: true, completion: nil)
    }
    
    //make buttons inactive if color already used
    @IBAction func colorSelected(_ sender: UIButton) {
        switch sender {
        case firstColorButton:
            delegate?.selectedColor = firstColorButton.backgroundColor
        case secondColorButton:
            delegate?.selectedColor = secondColorButton.backgroundColor
        case thirdColorButton:
            delegate?.selectedColor = thirdColorButton.backgroundColor
        case fourthColorButton:
            delegate?.selectedColor = fourthColorButton.backgroundColor
        case fifthColorButton:
            delegate?.selectedColor = fifthColorButton.backgroundColor
        case sixthColorButton:
            delegate?.selectedColor = sixthColorButton.backgroundColor
        case seventhColorButton:
            delegate?.selectedColor = seventhColorButton.backgroundColor
        case eigthColorButton:
            delegate?.selectedColor = eigthColorButton.backgroundColor
        default:
            return
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewStyle()
        activeView = delegate?.activeRow
        tempColor = activeButton?.backgroundColor
        activeButton?.backgroundColor = UIColor.lightGray
        for color in colorsSelected{
            if color == firstColorButton.backgroundColor {
                firstColorButton.isUserInteractionEnabled = false
                firstColorButton.backgroundColor = UIColor.lightGray
            } else if color == secondColorButton.backgroundColor {
                secondColorButton.isUserInteractionEnabled = false
                secondColorButton.backgroundColor = UIColor.lightGray
            } else if color == thirdColorButton.backgroundColor {
                thirdColorButton.isUserInteractionEnabled = false
                thirdColorButton.backgroundColor = UIColor.lightGray
            } else if color == fourthColorButton.backgroundColor {
                fourthColorButton.isUserInteractionEnabled = false
                fourthColorButton.backgroundColor = UIColor.lightGray
            } else if color == fifthColorButton.backgroundColor {
                fifthColorButton.isUserInteractionEnabled = false
                fifthColorButton.backgroundColor = UIColor.lightGray
            } else if color == sixthColorButton.backgroundColor {
                sixthColorButton.isUserInteractionEnabled = false
                sixthColorButton.backgroundColor = UIColor.lightGray
            } else if color == seventhColorButton.backgroundColor {
                seventhColorButton.isUserInteractionEnabled = false
                seventhColorButton.backgroundColor = UIColor.lightGray
            } else if color == eigthColorButton.backgroundColor {
                eigthColorButton.isUserInteractionEnabled = false
                eigthColorButton.backgroundColor = UIColor.lightGray
            }
        }
        
    }

    func setUpViewStyle(){
        pickColorLabel.layer.cornerRadius = 10
        pickColorLabel.backgroundColor = UIColor(red: 102/255, green: 104/255, blue: 104/255, alpha: 1.0)
        pickColorLabel.layer.masksToBounds = true
        innerView.layer.cornerRadius = 20
        firstColorButton.layer.cornerRadius = 20
        firstColorButton.backgroundColor = Color.violet.color
        secondColorButton.layer.cornerRadius = 20
        secondColorButton.backgroundColor = Color.pink.color
        thirdColorButton.layer.cornerRadius = 20
        thirdColorButton.backgroundColor = Color.blue.color
        fourthColorButton.layer.cornerRadius = 20
        fourthColorButton.backgroundColor = Color.peach.color
        fifthColorButton.layer.cornerRadius = 20
        fifthColorButton.backgroundColor = Color.mint.color
        sixthColorButton.layer.cornerRadius = 20
        sixthColorButton.backgroundColor = Color.yellow.color
        seventhColorButton.layer.cornerRadius = 20
        seventhColorButton.backgroundColor = Color.orange.color
        eigthColorButton.layer.cornerRadius = 20
        eigthColorButton.backgroundColor = Color.purple.color
    }

}
