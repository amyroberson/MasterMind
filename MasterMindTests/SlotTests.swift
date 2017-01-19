//
//  SlotTests.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import MasterMind

class SlotTests: XCTestCase {
    
    func testEquatable(){
        let color = Color.blue
        let blue = Color.blue
        
        let slot1 = Slot(color: .blue)
        let slot2 = Slot(color: blue)
        let slot3 = Slot(color: color)
        let slot4 = Slot(color: .orange)
        
        XCTAssertEqual(slot1, slot2)
        XCTAssertEqual(slot2, slot3)
        XCTAssertEqual(slot1, slot3)
        XCTAssertFalse(slot4 == slot3)
        
    }
    
}
