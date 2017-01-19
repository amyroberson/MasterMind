//
//  Guess.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Guess {
    var codeSet: CodeSet
    var pinSet: [Color] = []
    
    init?(codeSet: CodeSet?){
        if let code = codeSet {
            self.codeSet = code
        } else {
            return nil
        }
    }
    
    func evaluateGuess(code: CodeSet) -> Bool{
        if self.codeSet == code {
            pinSet = [.black, .black, .black, .black]
            return true
        } else{
            pinSet = createPins(code)
            return false
        }
    }
    
    func createPins(_ code: CodeSet) -> [Color]{
        var pins: [Color] = []
        if self.codeSet == code {
            pins = [.black, .black, .black, .black]
            return pins
        }
        if self.codeSet.slot1 == code.slot1 {
            pins.append(.black)
        } else if self.codeSet.slot1 == code.slot2 || self.codeSet.slot1 == code.slot3 || self.codeSet.slot1 == code.slot4 {
            pins.append(.white)
        }
        if self.codeSet.slot2 == code.slot2 {
            pins.append(.black)
        } else if self.codeSet.slot2 == code.slot1 || self.codeSet.slot2 == code.slot3 || self.codeSet.slot2 == code.slot4 {
            pins.append(.white)
        }
        if self.codeSet.slot3 == code.slot3 {
            pins.append(.black)
        } else if self.codeSet.slot3 == code.slot1 || self.codeSet.slot3 == code.slot2 || self.codeSet.slot3 == code.slot4 {
            pins.append(.white)
        }
        if self.codeSet.slot4 == code.slot4 {
            pins.append(.black)
        } else if self.codeSet.slot4 == code.slot1 || self.codeSet.slot4 == code.slot2 || self.codeSet.slot4 == code.slot3 {
            pins.append(.white)
        }
        pins.sort(by: {$0 < $1})

     return pins
    }
}
