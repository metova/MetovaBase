//
//  KeyboardAnimationInfo.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/26/16.
//  Copyright © 2016 Metova. All rights reserved.
//
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

/**
 The KeyboardAnimationInfo struct contains all of the needed info for a keyboard animation and is initialized using the notification that iOS fires in response to keyboard events.  The struct cleans up and abstracts away all the messy business involved in pulling values out of `NSNotification`.
 */
public struct KeyboardAnimationInfo {
    
    private static let keyboardNotificationNames: [String] = [
        Notification.Name.UIKeyboardWillShow.rawValue,
        Notification.Name.UIKeyboardDidShow.rawValue,
        Notification.Name.UIKeyboardWillHide.rawValue,
        Notification.Name.UIKeyboardDidHide.rawValue,
        Notification.Name.UIKeyboardWillChangeFrame.rawValue,
        Notification.Name.UIKeyboardDidChangeFrame.rawValue
    ]
    
    /// Identifies the start frame of the keyboard in screen coordinates. These coordinates do not take into account any rotation factors applied to the window’s contents as a result of interface orientation changes. Thus, you may need to convert the rectangle to window coordinates (using the `convertRect:fromWindow:` method) or to view coordinates (using the `convertRect:fromView:` method) before using it.  This is equivalent to the value found in the user info dictionar under the `UIKeyboardFrameBeginserInfoKey` key.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
    public let startFrame: CGRect
    
    /// Identifies the end frame of the keyboard in screen coordinates. These coordinates do not take into account any rotation factors applied to the window’s contents as a result of interface orientation changes. Thus, you may need to convert the rectangle to window coordinates (using the `convertRect:fromWindow:` method) or to view coordinates (using the `convertRect:fromView:` method) before using it.  This is equivalent to the value found in the user info dictionar under the `UIKeyboardFrameEndUserInfoKey` key.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
    public let endFrame: CGRect
    
    /// Identifies the duration of the animation in seconds.  This is equivalent to the value found in the user info dictionary under the `UIKeyboardAnimationDurationUserInfoKey` key.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
    public let animationDuration: TimeInterval
    
    /// Defines how the keyboard will be animated onto or off the screen.  This is equivalent to the value found in the user info dictionary under the `UIKeyboardAnimationCurveUserInfoKey` key.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
    public let animationCurve: UIViewAnimationCurve
    
    @available (iOS 9.0, *)
    /// Identifies whether the keyboard belongs to the current app. With multitasking on iPad, all visible apps are notified when the keyboard appears and disappears. The value of this property is `true` for the app that caused the keyboard to appear and `false` for any other apps.  This is equivalent to the value found in the user info dictionary under the `UIKeyboardIsLocalUserInfoKey` key.  For more information, see [Keyboard Notification User Info Keys](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/doc/constant_group/Keyboard_Notification_User_Info_Keys).
    public var isLocalUser: Bool {
        return _isLocalUser
    }
    
    private let _isLocalUser: Bool
    
    /**
     Creates a new instance.
     
     - parameter notification: The notification fired in response to a keyboard animation event.
     
     - returns: The new instance, or `nil` if an invalid notification is passed in.
     */
    public init?(notification: Notification) {
        guard KeyboardAnimationInfo.keyboardNotificationNames.contains(notification.name.rawValue) else {
            return nil
        }
                
        guard let animationInfo = notification.userInfo else {
            return nil
        }
        
        guard let startFrame = animationInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect else {
            return nil
        }
        
        self.startFrame = startFrame
        
        guard let endFrame = animationInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return nil
        }
        
        self.endFrame = endFrame
        
        guard let animationDuration = animationInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval else {
            return nil
        }
        
        self.animationDuration = animationDuration
        
        guard let
            animationCurveRaw = animationInfo[UIKeyboardAnimationCurveUserInfoKey] as? Int,
            let animationCurve = UIViewAnimationCurve(rawValue: animationCurveRaw) else {
                return nil
        }
        
        self.animationCurve = animationCurve
        
        if #available(iOS 9.0, *) {
            guard let isLocalUser = animationInfo[UIKeyboardIsLocalUserInfoKey] as? Bool else {
                return nil
            }
            
            _isLocalUser = isLocalUser
        }
        else {
            _isLocalUser = true
        }
    }
}
