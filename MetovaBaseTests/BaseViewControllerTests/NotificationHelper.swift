//
//  NotificationHelper.swift
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

func keyboardFrameBeginNotificationNoUserInfo() -> Notification {
    return Notification(name: Notification.Name(rawValue: UIKeyboardFrameBeginUserInfoKey), object: nil)
}

func keyboardFrameEndNotificationNoUserInfo() -> Notification {
    return Notification(name: Notification.Name(rawValue: UIKeyboardFrameEndUserInfoKey), object: nil)
}

func keyboardFrameBeginNotification(beginFrame: CGRect?, endFrame: CGRect?) -> Notification {
    return frame(withNotificationName: UIKeyboardFrameBeginUserInfoKey, beginFrame: beginFrame, endFrame: endFrame)
}

func keyboardFrameEndNotification(beginFrame: CGRect?, endFrame: CGRect?) -> Notification {
    return frame(withNotificationName: UIKeyboardFrameEndUserInfoKey, beginFrame: beginFrame, endFrame: endFrame)
}

private func frame(withNotificationName name: String, beginFrame: CGRect?, endFrame: CGRect?) -> Notification {
    var userInfo = [String: AnyObject]()
    
    if let beginFrame = beginFrame {
        userInfo[UIKeyboardFrameBeginUserInfoKey] = beginFrame as AnyObject
    }
    
    if let endFrame = endFrame {
        userInfo[UIKeyboardFrameEndUserInfoKey] = endFrame as AnyObject
    }
    
    return Notification(name: Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
}
