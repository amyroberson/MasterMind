//
//  CodeSetTests.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import MasterMind

class CodeSetTests: XCTestCase {
    
    func testInits(){
        let code1 = CodeSet(slot1: Slot(color: .orange), slot2: Slot(color: .blue), slot3: Slot(color: .pink), slot4: Slot(color:.peach))
        XCTAssertNotNil(code1)
        let code2 = CodeSet(slot1: Slot(color: .orange), slot2: Slot(color: .blue), slot3: Slot(color: .pink), slot4: Slot(color:.pink))
        let code3 = CodeSet(slot1: Slot(color: .orange), slot2: Slot(color: .blue), slot3: Slot(color: .pink), slot4: Slot(color:.orange))
        let code4 = CodeSet(slot1: Slot(color: .orange), slot2: Slot(color: .blue), slot3: Slot(color: .pink), slot4: Slot(color:.blue))
        XCTAssertNil(code2)
        XCTAssertNil(code3)
        XCTAssertNil(code4)
    }
   
    
    
}
