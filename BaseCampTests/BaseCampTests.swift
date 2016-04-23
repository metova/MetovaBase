//
//  BaseCamp_iOSTests.swift
//  BaseCamp iOSTests
//
//  Created by Nick Griffith on 4/22/16.
//
//

import XCTest
@testable import BaseCamp

class BaseCampTests: XCTestCase {
    
    // TODO: This example demonstrates that `BCTAssertNoException` works.  It is not intended to be part of the final test suite.
    func testExample() {
        BCTAssertNoException {
            let object = NSObject()
            object.performSelector(Selector("fooNotExistSelector"))
        }
    }
}
