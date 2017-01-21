//
//  Color.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation

enum Color : Int, Hashable {
    case violet = 0
    case pink = 1
    case blue = 2
    case peach = 3
    case mint = 4
    case yellow = 5
    case orange = 6
    case navy = 7
    case black = 8
    case white = 9
   
    //case base will be backgroundColor or close
    
    
    static func < (_ lhs: Color, _ rhs: Color) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var hashValue: Int {
        return rawValue.hashValue
    }
}

