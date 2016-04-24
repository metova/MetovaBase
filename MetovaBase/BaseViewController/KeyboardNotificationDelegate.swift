//
//  KeyboardNotificationDelegate.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//
//

import Foundation

@objc protocol KeyboardNotificationDelegate: class {
    @objc optional func keyboardWillShow(notification: NSNotification)
    @objc optional func keyboardDidShow(notification: NSNotification)
    @objc optional func keyboardWillChange(notification: NSNotification)
    @objc optional func keyboardDidChange(notification: NSNotification)
    @objc optional func keyboardWillHide(notification: NSNotification)
    @objc optional func keyboardDidHide(notification: NSNotification)
}
