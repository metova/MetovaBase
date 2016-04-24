//
//  BaseViewControllerFramesTests.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/23/16.
//
//

import XCTest

@testable import MetovaBase

class BaseViewControllerFramesTests: XCTestCase {
    
    let baseViewController = BaseViewController()
    
    func testFrameHelperBeginWithFrames() {
        let beginFromFrame = CGRect(x: 0, y: 10, width: 20, height: 30)
        let beginToFrame = CGRect(x: 40, y: 50, width: 60, height: 70)
        
        let beginNotification = keyboardFrameBeginNotification(beginFrame: beginFromFrame, endFrame: beginToFrame)
        
        let beginFrames = baseViewController.framesForKeyboardNotification(beginNotification)
        
        XCTAssertEqual(beginFrames.fromFrame, beginFromFrame)
        XCTAssertEqual(beginFrames.toFrame, beginToFrame)
    }
    
    func testFrameHelperBeginWithMissingEndFrame() {
        let beginFromFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        let beginNotification = keyboardFrameBeginNotification(beginFrame: beginFromFrame, endFrame: nil)
        
        let beginFrames = baseViewController.framesForKeyboardNotification(beginNotification)
        
        XCTAssertEqual(beginFrames.fromFrame, beginFromFrame)
        XCTAssertEqual(beginFrames.toFrame, CGRect.zero)
    }
    
    func testFrameHelperBeginWithMissingBeginFrame() {
        let beginToFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        let beginNotification = keyboardFrameBeginNotification(beginFrame: nil, endFrame: beginToFrame)
        
        let beginFrames = baseViewController.framesForKeyboardNotification(beginNotification)
        
        XCTAssertEqual(beginFrames.fromFrame, CGRect.zero)
        XCTAssertEqual(beginFrames.toFrame, beginToFrame)
    }
    
    func testFrameHelperBeginWithMissingBothFrames() {
        let beginNotification = keyboardFrameBeginNotification(beginFrame: nil, endFrame: nil)
        
        let beginFrames = baseViewController.framesForKeyboardNotification(beginNotification)
        
        XCTAssertEqual(beginFrames.fromFrame, CGRect.zero)
        XCTAssertEqual(beginFrames.toFrame, CGRect.zero)
    }
    
    func testFrameHelperBeginMissingUserInfo() {
        let beginNotification = keyboardFrameBeginNotificationNoUserInfo()
        
        let beginFrames = baseViewController.framesForKeyboardNotification(beginNotification)
        
        XCTAssertEqual(beginFrames.fromFrame, CGRect.zero)
        XCTAssertEqual(beginFrames.toFrame, CGRect.zero)
    }
    
    func testFrameHelperEndWithFrames() {
        let endFromFrame = CGRect(x: 0, y: 10, width: 20, height: 30)
        let endToFrame = CGRect(x: 40, y: 50, width: 60, height: 70)
        
        let endNotification = keyboardFrameEndNotification(beginFrame: endFromFrame, endFrame: endToFrame)
        
        let endFrames = baseViewController.framesForKeyboardNotification(endNotification)
        
        XCTAssertEqual(endFrames.fromFrame, endFromFrame)
        XCTAssertEqual(endFrames.toFrame, endToFrame)
    }
    
    func testFrameHelperEndWithMissingEndFrame() {
        let endFromFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        let endNotification = keyboardFrameBeginNotification(beginFrame: endFromFrame, endFrame: nil)
        
        let endFrames = baseViewController.framesForKeyboardNotification(endNotification)
        
        XCTAssertEqual(endFrames.fromFrame, endFromFrame)
        XCTAssertEqual(endFrames.toFrame, CGRect.zero)
    }
    
    func testFrameHelperEndWithMissingBeginFrame() {
        let endToFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
        
        let endNotification = keyboardFrameBeginNotification(beginFrame: nil, endFrame: endToFrame)
        
        let endFrames = baseViewController.framesForKeyboardNotification(endNotification)
        
        XCTAssertEqual(endFrames.fromFrame, CGRect.zero)
        XCTAssertEqual(endFrames.toFrame, endToFrame)
    }
    
    func testFrameHelperEndWithMissingBothFrames() {
        let endNotification = keyboardFrameBeginNotification(beginFrame: nil, endFrame: nil)
        
        let endFrames = baseViewController.framesForKeyboardNotification(endNotification)
        
        XCTAssertEqual(endFrames.fromFrame, CGRect.zero)
        XCTAssertEqual(endFrames.toFrame, CGRect.zero)
    }
    
    func testFrameHelperEndMissingUserInfo() {
        let endNotification = keyboardFrameBeginNotificationNoUserInfo()
        
        let endFrames = baseViewController.framesForKeyboardNotification(endNotification)
        
        XCTAssertEqual(endFrames.fromFrame, CGRect.zero)
        XCTAssertEqual(endFrames.toFrame, CGRect.zero)
    }

}