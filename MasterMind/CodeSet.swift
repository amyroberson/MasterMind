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
    
    
}
