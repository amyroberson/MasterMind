//
//  MasterMindViewController.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import UIKit

class MasterMindViewController: UIViewController, GameStatusViewControllerDelegate {

    var codeToMatch: CodeSet = CodeSet.random()
    var rowViews: [RowView] = []
    var activeRow: RowView? = nil
    var colorArray: [CGColor] = []
    var guess: Guess?
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    var gameStatusVC: GameStatusViewController?
    var activeIndex: Int = 0

    @IBOutlet weak var rowViewStack: UIStackView!
    @IBOutlet weak var masterMindLabel: UILabel!
    @IBOutlet weak var guessButton: UIButton!
    
    
    //creates a guess object and evaluates it to the codeToMatch displays the wining view or the next guessview
    //make this class a delegate to the win/lose screen
    @IBAction func guessButtonTapped(_ sender: UIButton) {
        colorArray = (activeRow?.colorsSelected) ?? []
        guard colorArray.count == 4 else { return }
        var colors: [Color] = []
        for color in colorArray{
            switch color{
            case UIColor(colorLiteralRed: 189.0/255, green: 153.0/255, blue: 1.0, alpha: 1).cgColor:
                colors.append(.violet)
            case UIColor(colorLiteralRed: 242.0/255, green: 121.0/255, blue: 199.0/255, alpha: 1).cgColor:
                colors.append(.pink)
            case UIColor(colorLiteralRed: 73.0/255, green: 101.0/255, blue: 238.0/255, alpha: 1).cgColor:
                colors.append(.blue)
            case UIColor(colorLiteralRed: 240.0/255, green: 209.0/255, blue: 143.0/255, alpha: 1).cgColor:
                colors.append(.peach)
            case UIColor(colorLiteralRed: 144.0/255, green: 243.0/255, blue: 221.0/255, alpha: 1).cgColor:
                colors.append(.mint)
            case UIColor(colorLiteralRed: 255.0/255, green: 254.0/255, blue: 144.0/255, alpha: 1).cgColor:
                colors.append(.yellow)
            case UIColor(colorLiteralRed: 241.0/255, green: 141.0/255, blue: 80.0/255, alpha: 1).cgColor:
                colors.append(.orange)
            case UIColor(colorLiteralRed: 136.0/255, green: 53.0/255, blue: 243.0/255, alpha: 1).cgColor:
                colors.append(.purple)
            default:
                return
            }
        }
        let guessCode = CodeSet(slot1: Slot(color: colors[0]), slot2: Slot(color: colors[1]), slot3: Slot(color: colors[2]), slot4: Slot(color: colors[3]))
        let guess = Guess(codeSet: guessCode)
        self.guess = guess
        if (guess?.evaluate(code: codeToMatch))! {
                present(gameStatusVC!, animated: true, completion: nil)
        } else {
            let pins = guess?.createPins(codeToMatch)
            activeRow?.pin1Label.layer.backgroundColor = pins?[0].color
            activeRow?.pin2Label.layer.backgroundColor = pins?[1].color
            activeRow?.pin3Label.layer.backgroundColor = pins?[2].color
            activeRow?.pin4Label.layer.backgroundColor = pins?[3].color
            if activeIndex <= 0 {
                present(gameStatusVC!, animated: true, completion: nil)
            } else {
                deactivateRow()
                activeIndex -= 1
                colorArray = []
                activeRow = rowViews[activeIndex]
                setActiveRow()
            }
        }
        
            
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessButton.layer.cornerRadius = 15
        masterMindLabel.layer.masksToBounds = true
        masterMindLabel.layer.cornerRadius = 15
        self.displayStacks()
        activeIndex = rowViews.count - 1
        activeRow = rowViews[activeIndex]
        self.setActiveRow()
        gameStatusVC = storyBoard.instantiateViewController(withIdentifier: "GameStatus") as? GameStatusViewController
        gameStatusVC?.delegate = self
    }

    func reset(){
        codeToMatch = CodeSet.random()
        activeIndex = rowViews.count - 1
        activeRow = rowViews[activeIndex]
        colorArray = []
        guess = nil
        for row in rowViews {
            row.updateAllButtonColors(color: Color.darkGrey.color)
            row.pin1Label.layer.backgroundColor = UIColor.gray.cgColor
            row.pin2Label.layer.backgroundColor = UIColor.gray.cgColor
            row.pin3Label.layer.backgroundColor = UIColor.gray.cgColor
            row.pin4Label.layer.backgroundColor = UIColor.gray.cgColor
        }
        self.setActiveRow()
    }
    
    
    
    // pulls up next view modally sends currentViewSelected
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
    }
}

