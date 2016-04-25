//
//  BaseViewControllerKeyboard.swift
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

import UIKit

extension BaseViewController: KeyboardNotificationDelegate {
    
    func addKeyboardNotifications() {
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillShow(_:)), forNotificationName: UIKeyboardWillShowNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidShow(_:)), forNotificationName: UIKeyboardDidShowNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillChange(_:)), forNotificationName: UIKeyboardWillChangeFrameNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidChange(_:)), forNotificationName: UIKeyboardDidChangeFrameNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillHide(_:)), forNotificationName: UIKeyboardWillHideNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidHide(_:)), forNotificationName: UIKeyboardDidHideNotification)
    }
    
    func removeKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }
    
    private func register(selector selector: Selector, forNotificationName name: String) {
        if respondsToSelector(selector) {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
        }
    }
}
