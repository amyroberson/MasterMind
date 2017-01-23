//
//  RowView.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/20/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class RowView: UIView {

    var slot1Button = UIButton()
    var slot2Button = UIButton()
    var slot3Button = UIButton()
    var slot4Button = UIButton()
    var pin1Label = UILabel()
    var pin2Label = UILabel()
    var pin3Label = UILabel()
    var pin4Label = UILabel()
    //var colorsSelected: [UIColor] = []
    override var intrinsicContentSize: CGSize {
        return CGSize(width: (self.superview?.frame.size.width) ?? 375, height: 60)
    }
    
    required override init(frame: CGRect){
        super.init(frame: frame)
        self.buttonSetUp()
        self.labelsSetUp()
        self.addItems()
        self.backgroundColor = UIColor(red: 237/255, green: 215/255, blue: 242/255, alpha: 1.0)
        self.areAllInteractable() //initializes to false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func buttonSetUp(){
        slot1Button.layer.cornerRadius = 20
        slot2Button.layer.cornerRadius = 20
        slot3Button.layer.cornerRadius = 20
        slot4Button.layer.cornerRadius = 20
        slot1Button.backgroundColor = UIColor.darkGray
        slot2Button.backgroundColor = UIColor.darkGray
        slot3Button.backgroundColor = UIColor.darkGray
        slot4Button.backgroundColor = UIColor.darkGray
        slot1Button.frame = CGRect(x: 15, y: 10, width: 40, height: 40)
        slot2Button.frame = CGRect(x: 70, y: 10, width: 40, height: 40)
        slot3Button.frame = CGRect(x: 125, y: 10, width: 40, height: 40)
        slot4Button.frame = CGRect(x: 180, y: 10, width: 40, height: 40)
    }
    
    func labelsSetUp(){
        pin1Label.layer.cornerRadius = 12
        pin2Label.layer.cornerRadius = 12
        pin3Label.layer.cornerRadius = 12
        pin4Label.layer.cornerRadius = 12
        pin1Label.layer.masksToBounds = true
        pin2Label.layer.masksToBounds = true
        pin3Label.layer.masksToBounds = true
        pin4Label.layer.masksToBounds = true
        pin1Label.text = ""
        pin2Label.text = ""
        pin3Label.text = ""
        pin4Label.text = ""
        pin1Label.backgroundColor = UIColor.gray
        pin2Label.backgroundColor = UIColor.gray
        pin3Label.backgroundColor = UIColor.gray
        pin4Label.backgroundColor = UIColor.gray
        pin1Label.frame = CGRect(x: 235, y: 18, width: 24, height: 24)
        pin2Label.frame = CGRect(x: 269, y: 18, width: 24, height: 24)
        pin3Label.frame = CGRect(x: 303, y: 18, width: 24, height: 24)
        pin4Label.frame = CGRect(x: 337, y: 18, width: 24, height: 24)
    }
    
    func addItems(){
        self.addSubview(slot1Button)
        self.addSubview(slot2Button)
        self.addSubview(slot3Button)
        self.addSubview(slot4Button)
        self.addSubview(pin1Label)
        self.addSubview(pin2Label)
        self.addSubview(pin3Label)
        self.addSubview(pin4Label)
    }
    
    func switchInteractable(object: UIButton){
        if object.isUserInteractionEnabled {
            object.isUserInteractionEnabled = false
        } else {
            object.isUserInteractionEnabled = true
        }
    }
    
    func areAllInteractable() {
        switchInteractable(object: slot1Button)
        switchInteractable(object: slot2Button)
        switchInteractable(object: slot3Button)
        switchInteractable(object: slot4Button)
    }
    
    func updateAllButtonColors(color: UIColor){
        slot1Button.backgroundColor = color
        slot2Button.backgroundColor = color
        slot3Button.backgroundColor = color
        slot4Button.backgroundColor = color
    }
   
}
