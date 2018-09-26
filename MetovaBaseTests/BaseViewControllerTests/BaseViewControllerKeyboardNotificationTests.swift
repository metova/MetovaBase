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
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = NoKeyboardMethodsClass()
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
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
                
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = WillShowMethodClass()
            testObject.expectation = expectation(description: "Keyboard Will Show Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
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
                
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = DidShowMethodClass()
            testObject.expectation = expectation(description: "Keyboard Did Show Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
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
                
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = WillChangeMethodClass()
            testObject.expectation = expectation(description: "Keyboard Will Change Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
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
                
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = DidChangeMethodClass()
            testObject.expectation = expectation(description: "Keyboard Did Change Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
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
                
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = WillHideMethodClass()
            testObject.expectation = expectation(description: "Keyboard Will Hide Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
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
                
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? CGRect)
                XCTAssertNotNil(userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)
            }
        }
        
        expectation(forNotification: UIWindow.didBecomeVisibleNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeHiddenNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didBecomeKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIWindow.didResignKeyNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidShowNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidChangeFrameNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardWillHideNotification, object: nil, handler: nil)
        expectation(forNotification: UIResponder.keyboardDidHideNotification, object: nil, handler: nil)
        
        MBAssertNoException {
            let testObject = DidHideMethodClass()
            testObject.expectation = expectation(description: "Keyboard Did Hide Called")
            testObject.loadView()
            testObject.viewDidLoad()
            postKeyboardNotifications()
        }
        
        waitForExpectations(timeout: 1, handler: nil)
    }
}

private func postKeyboardNotifications() {

    let keyboardNotificationNames = [
        UIWindow.didBecomeVisibleNotification,
        UIWindow.didBecomeHiddenNotification,
        UIWindow.didBecomeKeyNotification,
        UIWindow.didResignKeyNotification,
        UIResponder.keyboardWillShowNotification,
        UIResponder.keyboardDidShowNotification,
        UIResponder.keyboardWillHideNotification,
        UIResponder.keyboardDidHideNotification,
        UIResponder.keyboardWillChangeFrameNotification,
        UIResponder.keyboardDidChangeFrameNotification
    ]
    
    let userInfo = [
        UIResponder.keyboardFrameBeginUserInfoKey: CGRect.zero,
        UIResponder.keyboardFrameEndUserInfoKey: CGRect.zero
    ]

    for notificationName in keyboardNotificationNames {
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationName.rawValue), object: nil, userInfo: userInfo)
    }
    
}
