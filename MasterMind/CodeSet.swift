//
//  CodeSet.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


struct CodeSet : Equatable{
    let slot1: Slot
    let slot2: Slot
    let slot3: Slot
    let slot4: Slot
    
    var slots: [Slot] {
        return [slot1, slot2, slot3, slot4]
    }
    
    
    init?(slot1: Slot, slot2: Slot, slot3: Slot, slot4: Slot){
        if slot1 != slot2 && slot2 != slot3 && slot3 != slot4 && slot1 != slot4 && slot2 != slot4{
            self.slot1 = slot1
            self.slot2 = slot2
            self.slot3 = slot3
            self.slot4 = slot4
        } else {
            return nil
        }
    }
    
    static func == ( _ lhs: CodeSet, _ rhs: CodeSet) -> Bool{
        return lhs.slots == rhs.slots
    }
    
    static  func random() -> CodeSet{
        var colors: [Color] = [Color.blue, Color.mint, Color.purple, Color.orange, Color.peach, Color.pink, Color.violet, Color.yellow]
        var selected: [Slot] = []
        while selected.count < 4{
            let random = Int(arc4random_uniform(UInt32(colors.count)))
            selected.append(Slot(color: colors[random]))
            colors.remove(at: random)
        }
        return (self.init(slot1: selected[0], slot2: selected[1], slot3: selected[2], slot4: selected[3])!)
    
    }
    
    
}
