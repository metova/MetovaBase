//
//  KeyboardNotificationTests.swift
//  BaseCamp
//
//  Created by Nick Griffith on 4/23/16.
//
//

import XCTest

import UIKit
@testable import BaseCamp

class KeyboardNotificationTests: XCTestCase {
    
    func testNoMethodsImplemented() {
        class NoKeyboardMethodsClass: BaseViewController {}
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = NoKeyboardMethodsClass()
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectationsWithTimeout(0, handler: nil)
    }
}

private func postKeyboardNotifications() {
    let keyboardNotificationNames = [
        UIKeyboardWillShowNotification,
        UIKeyboardDidShowNotification,
        UIKeyboardWillChangeFrameNotification,
        UIKeyboardDidChangeFrameNotification,
        UIKeyboardWillHideNotification,
        UIKeyboardDidHideNotification
    ]
    
    // TODO: Pass the right values for these keys
    let userInfo = [
        UIKeyboardFrameBeginUserInfoKey : "frame begin",
        UIKeyboardFrameEndUserInfoKey : "frame end"
    ]

    for notificationName in keyboardNotificationNames {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: nil, userInfo: userInfo)
    }
}
