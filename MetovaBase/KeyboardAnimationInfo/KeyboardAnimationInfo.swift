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

// TOOD: Add doc comments

// TODO: Double check on all the keyboard notifications available here https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIWindow_Class/index.html#//apple_ref/c/data/UIWindowDidBecomeVisibleNotification

// TODO: Protocol+extensions per notification

// TODO: Unit test

/**
 *
 */
public struct KeyboardAnimationInfo {
    
    public let startFrame: CGRect
    public let endFrame: CGRect
    public let animationDuration: NSTimeInterval
    public let animationCurve: UIViewAnimationCurve
    
    @available (iOS 9.0, *)
    public var isLocalUser: Bool {
        return _isLocalUser
    }
    
    private let _isLocalUser: Bool
    
    init?(notification: NSNotification) {
        guard let animationInfo = notification.userInfo else {
            return nil
        }
        
        guard let startFrame = animationInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue() else {
            return nil
        }
        
        self.startFrame = startFrame
        
        guard let endFrame = animationInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue() else {
            return nil
        }
        
        self.endFrame = endFrame
        
        guard let animationDuration = animationInfo[UIKeyboardAnimationDurationUserInfoKey]?.doubleValue else {
            return nil
        }
        
        self.animationDuration = animationDuration
        
        guard let
            animationCurveRaw = animationInfo[UIKeyboardAnimationCurveUserInfoKey]?.integerValue,
            animationCurve = UIViewAnimationCurve(rawValue: animationCurveRaw) else {
                return nil
        }
        
        self.animationCurve = animationCurve
        
        if #available(iOS 9.0, *) {
            guard let isLocalUser = animationInfo[UIKeyboardIsLocalUserInfoKey]?.boolValue else {
                return nil
            }
            
            _isLocalUser = isLocalUser
        } else {
            _isLocalUser = true
        }
    }
}
