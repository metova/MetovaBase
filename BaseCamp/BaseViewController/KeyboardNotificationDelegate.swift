//
//  KeyboardNotificationDelegate.swift
//  BaseCamp
//
//  Created by Nick Griffith on 4/22/16.
//
//

import Foundation

@objc protocol KeyboardNotificationDelegate: class {
    optional func keyboardWillShow(notification: NSNotification)
    optional func keyboardDidShow(notification: NSNotification)
    optional func keyboardWillChange(notification: NSNotification)
    optional func keyboardDidChange(notification: NSNotification)
    optional func keyboardWillHide(notification: NSNotification)
    optional func keyboardDidHide(notification: NSNotification)
}
