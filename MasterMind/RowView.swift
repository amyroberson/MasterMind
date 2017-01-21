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
    override var intrinsicContentSize: CGSize {
        return CGSize(width: (self.superview?.frame.size.width) ?? 375, height: 60)
    }
    
    required override init(frame: CGRect){
        super.init(frame: frame)
        //self.frame.size.height = 60
        //self.frame.size.width = (self.superview?.frame.size.width) ?? 375
        self.buttonSetUp()
        self.labelsSetUp()
        self.addItems()
        //self.layer.backgroundColor = UIColor.cyan.cgColor
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
        slot1Button.layer.backgroundColor = UIColor.darkGray.cgColor
        slot2Button.layer.backgroundColor = UIColor.darkGray.cgColor
        slot3Button.layer.backgroundColor = UIColor.darkGray.cgColor
        slot4Button.layer.backgroundColor = UIColor.darkGray.cgColor
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
        pin1Label.text = ""
        pin2Label.text = ""
        pin3Label.text = ""
        pin4Label.text = ""
        pin1Label.layer.backgroundColor = UIColor.gray.cgColor
        pin2Label.layer.backgroundColor = UIColor.gray.cgColor
        pin3Label.layer.backgroundColor = UIColor.gray.cgColor
        pin4Label.layer.backgroundColor = UIColor.gray.cgColor
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
        if isUserInteractionEnabled {
            self.isUserInteractionEnabled = false
        } else {
            self.isUserInteractionEnabled = true
        }
    }
    
    func areAllInteractable() {
        switchInteractable(object: slot1Button)
        switchInteractable(object: slot2Button)
        switchInteractable(object: slot3Button)
        switchInteractable(object: slot4Button)
    }
    
    func updateAllButtonColors(color: CGColor){
        slot1Button.layer.backgroundColor = color
        slot2Button.layer.backgroundColor = color
        slot3Button.layer.backgroundColor = color
        slot4Button.layer.backgroundColor = color
    }
   
}
