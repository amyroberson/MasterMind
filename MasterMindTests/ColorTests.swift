//
//  ColorTests.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import MasterMind

class ColorTests: XCTestCase {
    
    func testevaluate(){
        let color1: Color = .violet
        let color2: Color = .pink
        let color3: Color = .blue
        let color4: Color = .peach
        let color5: Color = .purple
        let color6: Color = .black
        XCTAssertTrue(color1 < color6)
        XCTAssertTrue(color2 < color5)
        XCTAssertTrue(color3 < color4)
        XCTAssertFalse(color6 < color1)
        
    }
   
    
}
