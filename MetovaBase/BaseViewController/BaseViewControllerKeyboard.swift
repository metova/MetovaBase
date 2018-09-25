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
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillShow(notification:)), forNotification: Notification.Name.UIKeyboardWillShow)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidShow(notification:)), forNotification: Notification.Name.UIKeyboardDidShow)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillChangeFrame(notification:)), forNotification: Notification.Name.UIKeyboardWillChangeFrame)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidChangeFrame(notification:)), forNotification: Notification.Name.UIKeyboardDidChangeFrame)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillHide(notification:)), forNotification: Notification.Name.UIKeyboardWillHide)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidHide(notification:)), forNotification: Notification.Name.UIKeyboardDidHide)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidChangeFrame, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardDidHide, object: nil)
    }
    
    private func register(selector: Selector, forNotification name: Notification.Name) {
        if responds(to: selector) {
            NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
        }
    }
}
