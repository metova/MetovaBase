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
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillShow(notification:)), forNotification: UIResponder.keyboardWillShowNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidShow(notification:)), forNotification: UIResponder.keyboardDidShowNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillChangeFrame(notification:)), forNotification: UIResponder.keyboardWillChangeFrameNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidChangeFrame(notification:)), forNotification: UIResponder.keyboardDidChangeFrameNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillHide(notification:)), forNotification: UIResponder.keyboardWillHideNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidHide(notification:)), forNotification: UIResponder.keyboardDidHideNotification)
    }
    
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    private func register(selector: Selector, forNotification name: Notification.Name) {
        if responds(to: selector) {
            NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
        }
    }
}
