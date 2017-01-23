//
//  Color.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import Foundation
import UIKit

enum Color : Int, Hashable {
    case violet = 0
    case pink = 1
    case blue = 2
    case peach = 3
    case mint = 4
    case yellow = 5
    case orange = 6
    case purple = 7
    case black = 8
    case white = 9
    case darkGrey = 10
    case lightGrey = 11
   
    //case base will be backgroundColor or close
    
    
    static func < (_ lhs: Color, _ rhs: Color) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var hashValue: Int {
        return rawValue.hashValue
    }
    var color: UIColor {
        switch self{
        case .violet:
            return UIColor(colorLiteralRed: 189.0/255, green: 153.0/255, blue: 1.0, alpha: 1)
        case .pink:
            return UIColor(colorLiteralRed: 242.0/255, green: 121.0/255, blue: 199.0/255, alpha: 1)
        case .blue:
            return UIColor(colorLiteralRed: 73.0/255, green: 101.0/255, blue: 238.0/255, alpha: 1)
        case .peach:
            return UIColor(colorLiteralRed: 240.0/255, green: 209.0/255, blue: 143.0/255, alpha: 1)
        case .mint:
            return UIColor(colorLiteralRed: 144.0/255, green: 243.0/255, blue: 221.0/255, alpha: 1)
        case .yellow:
            return UIColor(colorLiteralRed: 255.0/255, green: 254.0/255, blue: 144.0/255, alpha: 1)
        case .orange:
            return UIColor(colorLiteralRed: 241.0/255, green: 141.0/255, blue: 80.0/255, alpha: 1)
        case .purple:
            return UIColor(colorLiteralRed: 136.0/255, green: 53.0/255, blue: 243.0/255, alpha: 1)
        case .black:
            return UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
        case .white:
            return UIColor(colorLiteralRed: 1, green: 1, blue: 1, alpha: 1)
        case .darkGrey:
            return UIColor.darkGray
        case .lightGrey:
            return UIColor.lightGray
            
        }
    }
    
    
}

