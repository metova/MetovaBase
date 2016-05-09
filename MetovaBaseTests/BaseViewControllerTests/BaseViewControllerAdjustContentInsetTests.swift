//
//  BaseViewControllerAdjustContentInsetTests.swift
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

@testable import MetovaBase

class BVControllerAdjustContentInsetTests: XCTestCase {
    
    // MARK: Properties
    
    let window = UIWindow(frame: UIScreen.mainScreen().bounds)
    
    
    
    // MARK: Helper
    
    func getTestVCWithFullscreenScrollView() -> (testVC: BaseViewController, scrollView: UIScrollView) {
        
        for subview in window.subviews {
            subview.removeFromSuperview()
        }
        
        let testVC = BaseViewController()
        window.rootViewController = testVC
        window.addSubview(testVC.view)
        
        testVC.loadView()
        testVC.viewDidLoad()
        testVC.view.frame = UIScreen.mainScreen().bounds
        
        let scrollView = UIScrollView(frame: UIScreen.mainScreen().bounds)
        testVC.view.addSubview(scrollView)
        
        return (testVC: testVC, scrollView: scrollView)
    }
    
    
    
    func simulateNotificationWithKeyboardHeight(keyboardHeight: CGFloat, testVC: BaseViewController, scrollView: UIScrollView) {
        
        let userInfo: [NSObject: AnyObject] = [
            UIKeyboardFrameEndUserInfoKey: NSValue(CGRect: CGRect(x: 0, y: UIScreen.mainScreen().bounds.height - keyboardHeight, width: UIScreen.mainScreen().bounds.width, height: keyboardHeight))
        ]
        
        let notification = NSNotification(name: UIKeyboardWillChangeFrameNotification, object: nil, userInfo: userInfo)
        
        testVC.adjustContentInset(scrollview: scrollView, forKeyboardWillChangeFrameNotification: notification)
    }
    
    
    
    // MARK: Tests
    
    func testContentInsetAdjustmentForFullscreenScrollView() {
        
        let (testVC, scrollView) = getTestVCWithFullscreenScrollView()
        
        // Simulate a keyboard appearance:
        simulateNotificationWithKeyboardHeight(100, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 100)
        
        // Simulate keyboard frame shrinking:
        simulateNotificationWithKeyboardHeight(80, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 80)
        
        // Simulate keyboard frame growing:
        simulateNotificationWithKeyboardHeight(90, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 90)
        
        // Simulate keyboard dismissal:
        simulateNotificationWithKeyboardHeight(0, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 0)
    }
    
    
    
    func testContentInsetAdjustmentForPartialScreenScrollView() {
        
        let (testVC, scrollView) = getTestVCWithFullscreenScrollView()
        
        var frame = testVC.view.frame
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - 10)
        scrollView.frame = frame
        
        // Simulate a keyboard appearance:
        simulateNotificationWithKeyboardHeight(100, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 90)
        
        // Simulate keyboard frame shrinking:
        simulateNotificationWithKeyboardHeight(80, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 70)
        
        // Simulate keyboard frame growing:
        simulateNotificationWithKeyboardHeight(90, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 80)
        
        // Simulate keyboard dismissal:
        simulateNotificationWithKeyboardHeight(0, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 0)
    }
    
    
    
    func testContentInsetAdjustmentIsUnaffectedIfKeyboardDoesNotCoverScrollView() {
        
        let (testVC, scrollView) = getTestVCWithFullscreenScrollView()
        
        var frame = testVC.view.frame
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - 100)
        scrollView.frame = frame
        
        // Simulate a keyboard appearance:
        simulateNotificationWithKeyboardHeight(100, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 0)
        
        // Simulate keyboard frame shrinking:
        simulateNotificationWithKeyboardHeight(80, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 0)
        
        // Simulate keyboard frame growing:
        simulateNotificationWithKeyboardHeight(90, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 0)
        
        // Simulate keyboard dismissal:
        simulateNotificationWithKeyboardHeight(0, testVC: testVC, scrollView: scrollView)
        XCTAssertEqual(scrollView.contentInset.bottom, 0)
    }
}
