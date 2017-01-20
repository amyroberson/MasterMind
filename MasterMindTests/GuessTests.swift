//
//  GuessTests.swift
//  MasterMind
//
//  Created by Amy Roberson on 1/19/17.
//  Copyright © 2017 Amy Roberson. All rights reserved.
//

import XCTest
@testable import MasterMind

class GuessTests: XCTestCase {
    
    func testInit(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let guess2 = Guess(codeSet: CodeSet(slot1: Slot(color: .black), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        XCTAssertFalse((guess1?.codeSet) == (guess2?.codeSet))
    }
    
    //MARK: Create Pins
    
    func testCreatePins(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .pink), slot2: Slot(color:.blue), slot3: Slot(color: .mint), slot4: Slot(color: .orange))
        XCTAssertNotNil(code)
        XCTAssertNotNil(guess1)
        let pins = (guess1?.createPins(code!))!
        let expected: [Color] = [.white, .white, .white]
        XCTAssertEqual(pins, expected)
    }
    
    func testCreatePins1(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .blue), slot2: Slot(color:.pink), slot3: Slot(color: .mint), slot4: Slot(color: .orange))
        XCTAssertNotNil(code)
        XCTAssertNotNil(guess1)
        let pins = (guess1?.createPins(code!))!
        let expected: [Color] = [.black, .black, .white]
        XCTAssertEqual(pins, expected)
    }
    
    func testCreatePins2(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .blue), slot2: Slot(color:.pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))
        XCTAssertNotNil(code)
        XCTAssertNotNil(guess1)
        let pins = (guess1?.createPins(code!))!
        let expected: [Color] = [.black, .black, .black, .black]
        XCTAssertEqual(pins, expected)
    }
    
    func testCreatePins3(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .peach), slot2: Slot(color:.mint), slot3: Slot(color: .pink), slot4: Slot(color: .blue))
        XCTAssertNotNil(code)
        XCTAssertNotNil(guess1)
        let pins = (guess1?.createPins(code!))!
        let expected: [Color] = [.white, .white, .white, .white]
        XCTAssertEqual(pins, expected)
    }
    
    func testCreatePins4(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .black), slot2: Slot(color:.white), slot3: Slot(color: .orange), slot4: Slot(color: .violet))
        XCTAssertNotNil(code)
        XCTAssertNotNil(guess1)
        let pins = (guess1?.createPins(code!))!
        let expected: [Color] = []
        XCTAssertEqual(pins, expected)
    }
    
    
    //MARK: Evaluate Guess
    
    func testevaluateGuess(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .black), slot2: Slot(color:.white), slot3: Slot(color: .orange), slot4: Slot(color: .violet))
        let result = guess1?.evaluate(code: code!)
        let expected = false
        XCTAssertEqual(result, expected)
    }
    
    func testevaluateGuess1(){
        let guess1 = Guess(codeSet: CodeSet(slot1: Slot(color: .blue), slot2: Slot(color: .pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))!)
        let code = CodeSet(slot1: Slot(color: .blue), slot2: Slot(color:.pink), slot3: Slot(color: .peach), slot4: Slot(color: .mint))
        let result = guess1?.evaluate(code: code!)
        let expected = true
        XCTAssertEqual(result, expected)
    }
}
