//
//  BaseViewControllerFirstResponderTests.swift
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

class BaseViewControllerFirstResponderTests: XCTestCase {
    
    // MARK: - Properties
    
    let testWindow = UIWindow(frame: UIScreen.main.bounds)
    
    // MARK: - Tests
    
    func testDismissKeyboard() {
        
        let testViewController = TestViewController()
        testWindow.addSubview(testViewController.view)
        
        testViewController.testTextField.becomeFirstResponder()
        XCTAssertTrue(testViewController.testTextField.isFirstResponder, "As a test setup criteria, the text field should be the first responder.")
        
        testViewController.dismissKeyboard()
        XCTAssertFalse(testViewController.testTextField.isFirstResponder, "The text field's first responder status should be resigned in order to dismiss the keyboard.")
    }
}

extension BaseViewControllerFirstResponderTests {
    
    class TestViewController: BaseViewController {
        
        let testTextField = UITextField()
        
        override func loadView() {
            
            let rootView = UIView()
            rootView.addSubview(testTextField)
            view = rootView
        }
    }
}
