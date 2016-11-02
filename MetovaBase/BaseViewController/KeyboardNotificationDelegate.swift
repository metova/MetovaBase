//
//  KeyboardNotificationDelegate.swift
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

import Foundation

/**
 This protocol contains a collection of methods which `BaseViewController` subclasses (or extensions) can implement in order to hear about keyboard notifications.  You do not need to register or unregister for these notifications in your subclass or extension--you simply need to implement these methods.
 
 `BaseViewController` uses the `respondsToSelector:` method on itself to determine whether or not it should register for these notifications.  As such, if implementing these in Swift, you must mark them as either `@objc` or `dynamic`.  If not, they are not implemented as selectors and `respondsToSelector:` returns `false`.
 
 For more information about the on-screen keyboard, see [Managing the Keyboard](https://developer.apple.com/library/ios/documentation/StringsTextFonts/Conceptual/TextAndWebiPhoneOS/KeyboardManagement/KeyboardManagement.html).
 */
@objc public protocol KeyboardNotificationDelegate: class {
    
    /**
     Called when the [`UIKeyboardWillShowNotification`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIKeyboardWillShowNotification) is fired.
     
     - parameter notification: A notification containing information about the keyboard appearance and location.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
     */
    @objc optional func keyboardWillShow(notification: Notification)
    
    /**
     Called when the [`UIKeyboardDidShowNotification`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIKeyboardDidShowNotification) is fired.
     
     - parameter notification: A notification containing information about the keyboard appearance and location.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
     */
    @objc optional func keyboardDidShow(notification: Notification)
    
    /**
     Called when the [`UIKeyboardWillChangeNotification`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIKeyboardWillChangeNotification) is fired.
     
     - parameter notification: A notification containing information about the keyboard appearance and location.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
     */
    @objc optional func keyboardWillChange(notification: Notification)
    
    /**
     Called when the [`UIKeyboardDidChangeNotification`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIKeyboardDidChangeNotification) is fired.
     
     - parameter notification: A notification containing information about the keyboard appearance and location.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
     */
    @objc optional func keyboardDidChange(notification: Notification)
    
    /**
     Called when the [`UIKeyboardWillHideNotification`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIKeyboardWillHideNotification) is fired.
     
     - parameter notification: A notification containing information about the keyboard appearance and location.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
     */
    @objc optional func keyboardWillHide(notification: Notification)
    
    /**
     Called when the [`UIKeyboardDidHideNotification`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIKeyboardDidHideNotification) is fired.
     
     - parameter notification: A notification containing information about the keyboard appearance and location.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
     */
    @objc optional func keyboardDidHide(notification: Notification)
}
