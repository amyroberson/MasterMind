//
//  Slot.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation


class Slot : Equatable{
    var color : Color

    init(color: Color){
        self.color = color
    }
    
    static func == (_ lhs: Slot, _ rhs: Slot) -> Bool {
        return lhs.color == rhs.color
    }
}
