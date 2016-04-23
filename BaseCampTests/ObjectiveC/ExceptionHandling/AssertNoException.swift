//
//  BaseCampAssertNoException.swift
//  BaseCamp
//
//  Created by Nick Griffith on 4/23/16.
//
//

import XCTest

public func BCTAssertNoException(@noescape closure: () -> Void) {
    XCTAssertNil(ObjCTry.executeBlock(closure))
}
