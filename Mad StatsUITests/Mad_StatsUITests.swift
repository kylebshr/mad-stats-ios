//
//  Mad_StatsUITests.swift
//  Mad StatsUITests
//
//  Created by Kyle Bashour on 3/28/16.
//  Copyright © 2016 Kyle Bashour. All rights reserved.
//

import XCTest

// I'm new to UI tests — these pass on iPhone, but not iPad :(
class Mad_StatsUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()

        continueAfterFailure = false

        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUI() {

        // Make sure we have the table and the right number of cells
        XCTAssertEqual(app.tables.count, 1)
        XCTAssertEqual(app.tables.cells.count, UInt(DataGenerator.games.count))

        // Tap the first cell
        app.tables.elementBoundByIndex(0).cells.elementBoundByIndex(0).tap()

        // Make sure we have another table and the right number of cells
        XCTAssertEqual(app.tables.count, 2)
        XCTAssertEqual(app.tables.elementBoundByIndex(0).cells.count, UInt(DataGenerator.statCount))

        // Tap the dimsiss button
        app.navigationBars["Season Statistics"].buttons["Stop"].tap()

        // Make sure we're back to one table
        XCTAssertEqual(app.tables.count, 1)
    }

    func testForceTouch() {


    }
}
