//
//  KeyboardNotificationTests.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//  Copyright (c) 2016 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


import XCTest

import UIKit
@testable import MetovaBase

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
    
    func testWillShowNotification() {
        class WillShowMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillShow(notification: NSNotification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue())
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue())
            }
        }
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = WillShowMethodClass()
            testObject.expectation = expectationWithDescription("Keyboard Will Show Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectationsWithTimeout(0, handler: nil)
    }
    
    func testDidShowNotification() {
        class DidShowMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardDidShow(notification: NSNotification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue())
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue())
            }
        }
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = DidShowMethodClass()
            testObject.expectation = expectationWithDescription("Keyboard Did Show Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectationsWithTimeout(0, handler: nil)
    }
    
    func testWillChangeNotification() {
        class WillChangeMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillChange(notification: NSNotification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue())
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue())
            }
        }
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = WillChangeMethodClass()
            testObject.expectation = expectationWithDescription("Keyboard Will Change Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectationsWithTimeout(0, handler: nil)
    }
    
    func testDidChangeNotification() {
        class DidChangeMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillChange(notification: NSNotification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue())
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue())
            }
        }
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = DidChangeMethodClass()
            testObject.expectation = expectationWithDescription("Keyboard Did Change Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectationsWithTimeout(0, handler: nil)
    }
    
    func testWillHideNotification() {
        class WillHideMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillHide(notification: NSNotification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue())
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue())
            }
        }
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = WillHideMethodClass()
            testObject.expectation = expectationWithDescription("Keyboard Will Hide Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectationsWithTimeout(0, handler: nil)
    }
    
    func testDidHideNotification() {
        class DidHideMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardDidHide(notification: NSNotification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue())
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue())
            }
        }
        
        expectationForNotification(UIKeyboardWillShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidShowNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardWillHideNotification, object: nil, handler: nil)
        expectationForNotification(UIKeyboardDidHideNotification, object: nil, handler: nil)
        
        BCTAssertNoException {
            let testObject = DidHideMethodClass()
            testObject.expectation = expectationWithDescription("Keyboard Did Hide Called")
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
    
    let userInfo = [
        UIKeyboardFrameBeginUserInfoKey : NSValue(CGRect: CGRect.zero),
        UIKeyboardFrameEndUserInfoKey : NSValue(CGRect: CGRect.zero)
    ]

    for notificationName in keyboardNotificationNames {
        NSNotificationCenter.defaultCenter().postNotificationName(notificationName, object: nil, userInfo: userInfo)
    }
}
