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
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = NoKeyboardMethodsClass()
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }

    func testWillShowNotification() {
        class WillShowMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillShow(notification: Notification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = WillShowMethodClass()
            testObject.expectation = expectation(description: "Keyboard Will Show Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testDidShowNotification() {
        class DidShowMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardDidShow(notification: Notification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = DidShowMethodClass()
            testObject.expectation = expectation(description: "Keyboard Did Show Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testWillChangeFrameNotification() {
        class WillChangeMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillChangeFrame(notification: Notification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = WillChangeMethodClass()
            testObject.expectation = expectation(description: "Keyboard Will Change Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testDidChangeFrameNotification() {
        class DidChangeMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillChangeFrame(notification: Notification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = DidChangeMethodClass()
            testObject.expectation = expectation(description: "Keyboard Did Change Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
    
    func testWillHideNotification() {
        class WillHideMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardWillHide(notification: Notification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = WillHideMethodClass()
            testObject.expectation = expectation(description: "Keyboard Will Hide Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0.5, handler: nil)
    }
    
    func testDidHideNotification() {
        class DidHideMethodClass: BaseViewController {
            
            var expectation: XCTestExpectation?
            
            @objc func keyboardDidHide(notification: Notification) {
                defer { expectation?.fulfill() }
                guard let userInfo = notification.userInfo else {
                    XCTFail("Failed to get user info dictionary")
                    return
                }
                
                XCTAssertNotNil(userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeVisible, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeHidden, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidBecomeKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIWindowDidResignKey, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidShow, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardWillHide, object: nil, handler: nil)
        expectation(forNotification: NSNotification.Name.UIKeyboardDidHide, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = DidHideMethodClass()
            testObject.expectation = expectation(description: "Keyboard Did Hide Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 0, handler: nil)
    }
}

private func postKeyboardNotifications() {

    let keyboardNotificationNames = [
        NSNotification.Name.UIWindowDidBecomeVisible,
        NSNotification.Name.UIWindowDidBecomeHidden,
        NSNotification.Name.UIWindowDidBecomeKey,
        NSNotification.Name.UIWindowDidResignKey,
        NSNotification.Name.UIKeyboardWillShow,
        NSNotification.Name.UIKeyboardDidShow,
        NSNotification.Name.UIKeyboardWillHide,
        NSNotification.Name.UIKeyboardDidHide,
        NSNotification.Name.UIKeyboardWillChangeFrame,
        NSNotification.Name.UIKeyboardDidChangeFrame
    ]
    
    let userInfo = [
        UIKeyboardFrameBeginUserInfoKey: CGRect.zero,
        UIKeyboardFrameEndUserInfoKey: CGRect.zero
    ]

    for notificationName in keyboardNotificationNames {
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName.rawValue), object: nil, userInfo: userInfo)
    }
    
}
