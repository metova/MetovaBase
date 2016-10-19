//
//  KeyboardAnimationInfoTests.swift
//  MetovaBase
//
//  Created by Nick Griffith on 5/9/16.
//  Copyright © 2016 Metova. All rights reserved.
//

import XCTest

@testable import MetovaBase

private let keyboardNotificationNames: [String] = [
    NSNotification.Name.UIKeyboardWillShow.rawValue,
    NSNotification.Name.UIKeyboardDidShow.rawValue,
    NSNotification.Name.UIKeyboardWillHide.rawValue,
    NSNotification.Name.UIKeyboardDidHide.rawValue,
    NSNotification.Name.UIKeyboardWillChangeFrame.rawValue,
    NSNotification.Name.UIKeyboardDidChangeFrame.rawValue
]

private let keyboardUserInfoKeys: [String] = [
    UIKeyboardFrameBeginUserInfoKey,
    UIKeyboardFrameEndUserInfoKey,
    UIKeyboardAnimationDurationUserInfoKey,
    UIKeyboardAnimationCurveUserInfoKey,
    UIKeyboardIsLocalUserInfoKey
]

class KeyboardAnimationInfoTests: XCTestCase {

    func testInitWithGoodNotification() {
        for notificationName in keyboardNotificationNames {
            let notification = keyboardNotification(name: notificationName)
            XCTAssertNotNil(
                KeyboardAnimationInfo(notification: notification),
                "Failed to instantiate KeyboardAnimationInfo for notification named \(notificationName)."
            )
        }
    }
    
    func testInitWithBadNotificationName() {
        let notification = keyboardNotification(name: "TEST")
        XCTAssertNil(
            KeyboardAnimationInfo(notification: notification),
            "Instantiated KeyboardAnimationInfo despite bad notification name."
        )
    }
    
    func testMissingKeys() {
        for notificationName in keyboardNotificationNames {
            for missingKey in keyboardUserInfoKeys {
                let notification = keyboardNotification(name: notificationName, missingKeys: [missingKey])
                
                XCTAssertNil(
                    KeyboardAnimationInfo(notification: notification),
                    "Instantiated KeyboardAnimationInfo with notification name \(notificationName) despite missing key \(missingKey)."
                )
            }
        }
    }
    
    func testProperties() {
        for notificationName in keyboardNotificationNames {
            let notification = keyboardNotification(name: notificationName)
            
            guard let kaInfo = KeyboardAnimationInfo(notification: notification) else {
                XCTFail("Failed to instantiate KeyboardAnimationInfo for notification named \(notificationName).")
                continue
            }
                        
            XCTAssertEqual(
                kaInfo.startFrame, CGRect.zero,
                "Incorrect start frame for notification named \(notificationName)"
            )
            
            XCTAssertEqual(
                kaInfo.endFrame, CGRect.zero,
                "Incorrect end frame for notification named \(notificationName)"
            )
            
            XCTAssertEqual(
                kaInfo.animationDuration, 0,
                "Incorrect animation duration for notification named \(notificationName)"
            )
            
            XCTAssertEqual(
                kaInfo.animationCurve, UIViewAnimationCurve.linear,
                "Incorrect animation curve for notification named \(notificationName)"
            )
            
            XCTAssertEqual(
                kaInfo.isLocalUser, true,
                "Incorrect local user value for notification named \(notificationName)"
            )
            
        }
    }
    
    func testNoUserInfo() {
        for notificationName in keyboardNotificationNames {
            let notification = Notification(name: Notification.Name(rawValue: notificationName), object: nil)
            
            XCTAssertNil(
                KeyboardAnimationInfo(notification: notification),
                "Instantiated KeyboardAnimationInfo with notification name \(notificationName) despite missing user info."
            )
        }
    }
}
